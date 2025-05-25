-- Active: 1747539678514@@127.0.0.1@9000@conservation_db
CREATE DATABASE conservation_db;


CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    region TEXT NOT NULL
);


CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name TEXT NOT NULL,
    scientific_name TEXT NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status TEXT NOT NULL
);

CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id SERIAL REFERENCES rangers(ranger_id),
    species_id SERIAL REFERENCES species(species_id),
    sighting_time TIMESTAMP NOT NULL,
    location TEXT NOT NULL,
    notes TEXT
);


CREATE INDEX idx_sightings_ranger ON sightings(ranger_id);
CREATE INDEX idx_sightings_species ON sightings(species_id);


INSERT INTO rangers (ranger_id, name, region) VALUES
    (1, 'Alice Green', 'Northern Hills'),
    (2, 'Bob White', 'River Delta'),
    (3, 'Carol King', 'Mountain Range');
INSERT INTO species (species_id, common_name, scientific_name, discovery_date, conservation_status) VALUES
    (1, 'Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
    (2, 'Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
    (3, 'Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
    (4, 'Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');
INSERT INTO sightings (sighting_id, ranger_id, species_id, sighting_time, location, notes) VALUES
    (1, '1', '1', '2024-05-10 07:45:00', 'Peak Ridge', 'Camera trap image captured'),
    (2, '2', '2', '2024-05-12 16:20:00', 'Bankwood Area', 'Juvenile seen'),
    (3, '3', '3', '2024-05-15 09:10:00', 'Bamboo Grove East', 'Feeding observed'),
    (4, '2', '1', '2024-05-18 18:30:00', 'Snowfall Pass', NULL);

    
