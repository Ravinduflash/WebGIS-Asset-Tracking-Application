import psycopg2
import time
import random

# --- Database Connection Parameters (Same as app.py) ---
DB_HOST = "localhost"
DB_NAME = "postgres"
DB_USER = "postgres"
DB_PASS = "root" # CHANGE THIS

UPDATE_INTERVAL_SECONDS = 5 # How often to update positions

print("Starting asset movement simulation...")

try:
    conn = psycopg2.connect(host=DB_HOST, database=DB_NAME, user=DB_USER, password=DB_PASS)
    while True:
        cur = conn.cursor()
        try:
            # Get current asset IDs and locations
            cur.execute("SELECT id, ST_X(geom), ST_Y(geom) FROM assets;")
            assets = cur.fetchall()

            if not assets:
                print("No assets found in database. Waiting...")

            for asset_id, lon, lat in assets:
                # Simple random walk: add small random offset
                new_lon = lon + random.uniform(-0.0005, 0.0005) # Adjust range for desired speed
                new_lat = lat + random.uniform(-0.0005, 0.0005)

                # Use the PUT logic (or direct UPDATE)
                cur.execute("""
                    UPDATE assets
                    SET geom = ST_SetSRID(ST_MakePoint(%s, %s), 4326),
                        last_seen = NOW()
                    WHERE id = %s;
                """, (new_lon, new_lat, asset_id))
                print(f"Updated asset {asset_id} to ({new_lon:.4f}, {new_lat:.4f})")

            conn.commit() # Commit all updates for this interval
            print(f"--- Updates committed. Waiting for {UPDATE_INTERVAL_SECONDS} seconds... ---")

        except Exception as update_error:
            print(f"Error during update loop: {update_error}")
            conn.rollback() # Rollback partial updates if one fails
        finally:
             cur.close()


        time.sleep(UPDATE_INTERVAL_SECONDS) # Wait before next update cycle

except psycopg2.OperationalError as e:
     print(f"Database connection error: {e}")
except KeyboardInterrupt:
    print("Simulation stopped by user.")
finally:
    if conn:
        conn.close()
        print("Database connection closed.")