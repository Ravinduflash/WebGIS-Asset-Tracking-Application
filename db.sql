/* 2025-05-03 19:30:18 [1539 ms] */ 
CREATE EXTENSION postgis;
/* 2025-05-03 19:30:18 [1539 ms] */ 
CREATE EXTENSION postgis;
/* 2025-05-03 19:30:47 [76 ms] */ 
CREATE TABLE assets (
    id SERIAL PRIMARY KEY,
    name TEXT,
    asset_type TEXT,
    last_seen TIMESTAMP DEFAULT NOW(),
    geom GEOMETRY(Point, 4326) -- Point geometry, WGS84 projection
);
/* 2025-05-03 19:30:47 [76 ms] */ 
CREATE TABLE assets (
    id SERIAL PRIMARY KEY,
    name TEXT,
    asset_type TEXT,
    last_seen TIMESTAMP DEFAULT NOW(),
    geom GEOMETRY(Point, 4326) -- Point geometry, WGS84 projection
);
/* 2025-05-03 19:30:50 [9 ms] */ 
CREATE INDEX idx_assets_geom ON assets USING GIST (geom);
/* 2025-05-03 19:30:50 [9 ms] */ 
CREATE INDEX idx_assets_geom ON assets USING GIST (geom);
/* 2025-05-03 19:31:47 [8 ms] */ 
INSERT INTO assets (name, asset_type, geom)
VALUES ('Truck 1', 'vehicle', ST_SetSRID(ST_MakePoint(79.88, 6.90), 4326));
/* 2025-05-03 19:31:47 [8 ms] */ 
INSERT INTO assets (name, asset_type, geom)
VALUES ('Truck 1', 'vehicle', ST_SetSRID(ST_MakePoint(79.88, 6.90), 4326));
/* 2025-05-03 19:32:00 [2 ms] */ 
INSERT INTO assets (name, asset_type, geom) VALUES ('Sensor A', 'sensor', ST_SetSRID(ST_MakePoint(79.90, 6.91), 4326));
/* 2025-05-03 19:32:00 [2 ms] */ 
INSERT INTO assets (name, asset_type, geom) VALUES ('Sensor A', 'sensor', ST_SetSRID(ST_MakePoint(79.90, 6.91), 4326));
/* 2025-05-03 19:32:02 [3 ms] */ 
INSERT INTO assets (name, asset_type, geom) VALUES ('Personnel 1', 'person', ST_SetSRID(ST_MakePoint(79.87, 6.89), 4326));
/* 2025-05-03 19:32:02 [3 ms] */ 
INSERT INTO assets (name, asset_type, geom) VALUES ('Personnel 1', 'person', ST_SetSRID(ST_MakePoint(79.87, 6.89), 4326));
/* 2025-05-03 19:32:04 [4 ms] */ 
INSERT INTO assets (name, asset_type, geom) VALUES ('Vehicle 2', 'vehicle', ST_SetSRID(ST_MakePoint(79.885, 6.905), 4326));
/* 2025-05-03 19:32:04 [4 ms] */ 
INSERT INTO assets (name, asset_type, geom) VALUES ('Vehicle 2', 'vehicle', ST_SetSRID(ST_MakePoint(79.885, 6.905), 4326));
/* 2025-05-03 19:32:06 [3 ms] */ 
INSERT INTO assets (name, asset_type, geom) VALUES ('Equipment X', 'equipment', ST_SetSRID(ST_MakePoint(79.89, 6.88), 4326));
/* 2025-05-03 19:32:06 [3 ms] */ 
INSERT INTO assets (name, asset_type, geom) VALUES ('Equipment X', 'equipment', ST_SetSRID(ST_MakePoint(79.89, 6.88), 4326));
/* 2025-05-03 19:32:58 [3 ms] */ 
SELECT id, name, ST_AsText(geom) FROM assets LIMIT 100;
/* 2025-05-03 19:32:58 [3 ms] */ 
SELECT id, name, ST_AsText(geom) FROM assets LIMIT 100;
/* 2025-05-04 15:19:28 [16 ms] */ 
INSERT INTO assets (name, asset_type, geom) VALUES ('Delivery Van 5', 'vehicle', ST_SetSRID(ST_MakePoint(79.875, 6.905), 4326));
/* 2025-05-04 15:19:28 [16 ms] */ 
INSERT INTO assets (name, asset_type, geom) VALUES ('Delivery Van 5', 'vehicle', ST_SetSRID(ST_MakePoint(79.875, 6.905), 4326));
/* 2025-05-04 15:19:29 [3 ms] */ 
INSERT INTO assets (name, asset_type, geom) VALUES ('Shuttle Bus Alpha', 'vehicle', ST_SetSRID(ST_MakePoint(79.895, 6.915), 4326));
/* 2025-05-04 15:19:29 [3 ms] */ 
INSERT INTO assets (name, asset_type, geom) VALUES ('Shuttle Bus Alpha', 'vehicle', ST_SetSRID(ST_MakePoint(79.895, 6.915), 4326));
/* 2025-05-04 15:19:30 [2 ms] */ 
INSERT INTO assets (name, asset_type, geom) VALUES ('Motorbike Courier', 'vehicle', ST_SetSRID(ST_MakePoint(79.888, 6.892), 4326));
/* 2025-05-04 15:19:30 [2 ms] */ 
INSERT INTO assets (name, asset_type, geom) VALUES ('Motorbike Courier', 'vehicle', ST_SetSRID(ST_MakePoint(79.888, 6.892), 4326));
/* 2025-05-04 15:19:31 [2 ms] */ 
INSERT INTO assets (name, asset_type, geom) VALUES ('Security Patrol Car 2', 'vehicle', ST_SetSRID(ST_MakePoint(79.860, 6.880), 4326));
/* 2025-05-04 15:19:31 [2 ms] */ 
INSERT INTO assets (name, asset_type, geom) VALUES ('Security Patrol Car 2', 'vehicle', ST_SetSRID(ST_MakePoint(79.860, 6.880), 4326));
/* 2025-05-04 15:19:33 [3 ms] */ 
INSERT INTO assets (name, asset_type, geom) VALUES ('Field Engineer 3', 'person', ST_SetSRID(ST_MakePoint(79.881, 6.912), 4326));
/* 2025-05-04 15:19:33 [3 ms] */ 
INSERT INTO assets (name, asset_type, geom) VALUES ('Field Engineer 3', 'person', ST_SetSRID(ST_MakePoint(79.881, 6.912), 4326));
/* 2025-05-04 15:19:34 [3 ms] */ 
INSERT INTO assets (name, asset_type, geom) VALUES ('Surveyor Team Lead', 'person', ST_SetSRID(ST_MakePoint(79.902, 6.899), 4326));
/* 2025-05-04 15:19:34 [3 ms] */ 
INSERT INTO assets (name, asset_type, geom) VALUES ('Surveyor Team Lead', 'person', ST_SetSRID(ST_MakePoint(79.902, 6.899), 4326));
/* 2025-05-04 15:19:35 [2 ms] */ 
INSERT INTO assets (name, asset_type, geom) VALUES ('Guard Post B', 'person', ST_SetSRID(ST_MakePoint(79.877, 6.885), 4326));
/* 2025-05-04 15:19:35 [2 ms] */ 
INSERT INTO assets (name, asset_type, geom) VALUES ('Guard Post B', 'person', ST_SetSRID(ST_MakePoint(79.877, 6.885), 4326));
/* 2025-05-04 15:19:38 [3 ms] */ 
INSERT INTO assets (name, asset_type, geom) VALUES ('Portable Generator 1', 'equipment', ST_SetSRID(ST_MakePoint(79.910, 6.908), 4326));
/* 2025-05-04 15:19:38 [3 ms] */ 
INSERT INTO assets (name, asset_type, geom) VALUES ('Portable Generator 1', 'equipment', ST_SetSRID(ST_MakePoint(79.910, 6.908), 4326));
/* 2025-05-04 15:19:38 [3 ms] */ 
INSERT INTO assets (name, asset_type, geom) VALUES ('Air Quality Monitor 7', 'sensor', ST_SetSRID(ST_MakePoint(79.865, 6.918), 4326));
/* 2025-05-04 15:19:38 [3 ms] */ 
INSERT INTO assets (name, asset_type, geom) VALUES ('Air Quality Monitor 7', 'sensor', ST_SetSRID(ST_MakePoint(79.865, 6.918), 4326));
/* 2025-05-04 15:19:40 [3 ms] */ 
INSERT INTO assets (name, asset_type, geom) VALUES ('Traffic Camera Feed', 'sensor', ST_SetSRID(ST_MakePoint(79.892, 6.895), 4326));
/* 2025-05-04 15:19:40 [3 ms] */ 
INSERT INTO assets (name, asset_type, geom) VALUES ('Traffic Camera Feed', 'sensor', ST_SetSRID(ST_MakePoint(79.892, 6.895), 4326));
/* 2025-05-04 15:19:41 [2 ms] */ 
INSERT INTO assets (name, asset_type, geom) VALUES ('Construction Toolset A', 'equipment', ST_SetSRID(ST_MakePoint(79.870, 6.900), 4326));
/* 2025-05-04 15:19:41 [2 ms] */ 
INSERT INTO assets (name, asset_type, geom) VALUES ('Construction Toolset A', 'equipment', ST_SetSRID(ST_MakePoint(79.870, 6.900), 4326));
/* 2025-05-04 15:19:46 [4 ms] */ 
INSERT INTO assets (name, asset_type, geom) VALUES ('Drone Observer 1', 'drone', ST_SetSRID(ST_MakePoint(79.883, 6.919), 4326));
/* 2025-05-04 15:19:46 [4 ms] */ 
INSERT INTO assets (name, asset_type, geom) VALUES ('Drone Observer 1', 'drone', ST_SetSRID(ST_MakePoint(79.883, 6.919), 4326));
/* 2025-05-04 15:19:47 [4 ms] */ 
INSERT INTO assets (name, asset_type, geom) VALUES ('Shipping Container 42', 'container', ST_SetSRID(ST_MakePoint(79.908, 6.875), 4326));
/* 2025-05-04 15:19:47 [4 ms] */ 
INSERT INTO assets (name, asset_type, geom) VALUES ('Shipping Container 42', 'container', ST_SetSRID(ST_MakePoint(79.908, 6.875), 4326));
/* 2025-05-04 15:19:48 [2 ms] */ 
INSERT INTO assets (name, asset_type, geom) VALUES ('Tagged Wildlife (Deer)', 'animal', ST_SetSRID(ST_MakePoint(79.855, 6.922), 4326));
/* 2025-05-04 15:19:48 [2 ms] */ 
INSERT INTO assets (name, asset_type, geom) VALUES ('Tagged Wildlife (Deer)', 'animal', ST_SetSRID(ST_MakePoint(79.855, 6.922), 4326));
