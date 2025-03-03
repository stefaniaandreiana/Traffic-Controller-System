CREATE DATABASE traffic_controller;

USE traffic_controller;

CREATE TABLE traffic_lights (
    id INT AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR(255) NOT NULL,
    color ENUM('RED', 'YELLOW', 'GREEN') NOT NULL DEFAULT 'RED',
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE routes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    start_location VARCHAR(255) NOT NULL,
    end_location VARCHAR(255) NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE diversions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    route_id INT,
    diversion_location VARCHAR(255) NOT NULL,
    start_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    end_time TIMESTAMP,
    FOREIGN KEY (route_id) REFERENCES routes(id)
);

CREATE TABLE traffic_events (
    id INT AUTO_INCREMENT PRIMARY KEY,
    event_type ENUM('ACCIDENT', 'BLOCKAGE', 'ROADWORK') NOT NULL,
    location VARCHAR(255) NOT NULL,
    start_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    end_time TIMESTAMP
);
