# WebGIS Asset Tracking Application

## Overview
We have built a complete WebGIS asset tracking application that integrates OpenLayers, Flask, and PostGIS. This application provides real-time visualization and tracking of assets on an interactive map.

## Key Components

### 1. Database Layer
- **Technology**: PostgreSQL with PostGIS extension
- **Purpose**: Provides spatial data storage capabilities, storing asset information and their locations as geometric points.

### 2. Backend Layer
- **Technology**: Flask API
- **Purpose**: Serves as the middleware, processing requests from the frontend, querying the database, and returning GeoJSON data. It handles both retrieving asset locations and updating them.

### 3. Frontend Layer
- **Technology**: OpenLayers
- **Purpose**: Displays the map and assets, with periodic updates to show real-time positions. It includes interactive features like popups and filtering.

## Features
- **Real-Time Visualization**: Near real-time visualization of asset locations on an interactive map.
- **Filtering**: Ability to filter assets by type (e.g., vehicle, person, sensor, etc.).
- **Popups**: Interactive popups displaying detailed asset information.
- **Periodic Updates**: Automatic updates to reflect the latest asset positions.

## Benefits
Custom tracking solutions can help organizations fulfill specific business requirements while maintaining control over their data and infrastructure. The resulting application provides:
- Near real-time visualization of asset locations.
- Ability to review movement history.
- Filtering by asset types.
- Modular design for easy customization and extension.

## Future Extensions
The modular approach allows for easy customization and extension to support additional features such as:
- Geofencing
- Route optimization
- Integration with other business systems

## How to Run
1. **Setup the Database**:
   - Install PostgreSQL and PostGIS.
   - Create a database and configure the `assets` table with spatial data.

2. **Backend Setup**:
   - Install Python dependencies using `pip install -r requirements.txt`.
   - Configure database connection parameters in `app.py`.
   - Run the Flask server using `python app.py`.

3. **Frontend Setup**:
   - Open the `index.html` file in a browser.
   - Ensure the Flask server is running to fetch data.

4. **Simulate Asset Movement**:
   - Run `simulate_movement.py` to simulate asset movement in the database.

## Authors
- G.M.R. Dulshan