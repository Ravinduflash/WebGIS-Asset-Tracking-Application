from flask import Flask, jsonify, request, render_template # Added render_template
from flask_cors import CORS
import psycopg2
import psycopg2.extras # For dictionary cursor
import json # To parse GeoJSON string from DB
import logging

app = Flask(__name__)
CORS(app) # Enable CORS for all routes

# Database connection parameters - CHANGE THESE!
DB_HOST = "localhost"
DB_NAME = "postgres" # Use the name you created
DB_USER = "postgres" # Or your specific user
DB_PASS = "root" # The password you set

# Establish a connection (consider pooling for production)
conn = psycopg2.connect(host=DB_HOST, database=DB_NAME,
                        user=DB_USER, password=DB_PASS)

logging.basicConfig(level=logging.DEBUG)

# --- Add API endpoints below ---

@app.route("/api/assets", methods=["GET"])
def get_assets():
    try:
        cur = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        logging.debug("Executing query to fetch assets")
        cur.execute("""
            SELECT id, name, asset_type, last_seen,
                   ST_AsGeoJSON(geom) AS geojson_geom
            FROM assets;
        """)
        rows = cur.fetchall()
        cur.close()

        features = []
        for row in rows:
            # Parse the GeoJSON geometry string into a Python dict
            geom_dict = json.loads(row["geojson_geom"])
            properties = {
                "id": row["id"],
                "name": row["name"],
                "asset_type": row["asset_type"],
                "last_seen": row["last_seen"].isoformat() + 'Z'  # Format timestamp
            }
            features.append({
                "type": "Feature",
                "geometry": geom_dict,
                "properties": properties
            })

        feature_collection = {
            "type": "FeatureCollection",
            "features": features
        }
        return jsonify(feature_collection)
    except Exception as e:
        conn.rollback()  # Rollback the transaction on error
        logging.error(f"Error fetching assets: {e}")
        return jsonify({"status": "error", "message": str(e)}), 500

@app.route("/api/assets/<int:asset_id>", methods=["PUT"])
def update_asset(asset_id):
    data = request.get_json()
    new_lon = data.get("longitude")
    new_lat = data.get("latitude")

    if new_lon is None or new_lat is None:
        return jsonify({"error": "Missing coordinates"}), 400

    try:
        cur = conn.cursor()
        # Use parameterized query to prevent SQL injection
        cur.execute("""
            UPDATE assets
            SET geom = ST_SetSRID(ST_MakePoint(%s, %s), 4326),
                last_seen = NOW()
            WHERE id = %s;
        """, (new_lon, new_lat, asset_id))
        conn.commit() # Commit the transaction
        cur.close()
        return jsonify({"status": "success"})
    except Exception as e:
        conn.rollback() # Rollback in case of error
        return jsonify({"status": "error", "message": str(e)}), 500
    
@app.route('/')
def index():
    # Assumes index.html is in a folder named 'templates'
    return render_template('index.html')

if __name__ == '__main__':
    app.run(debug=True) # Debug mode is helpful during development