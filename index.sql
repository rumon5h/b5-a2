-- Active: 1747539678514@@127.0.0.1@9000@conservation_db
CREATE DATABASE conservation_db;


CREATE TABLE rangers (
    ranger_id UUID PRIMARY KEY,
    name TEXT NOT NULL,
    region TEXT NOT NULL
);


CREATE TABLE species (
    species_id UUID PRIMARY KEY,
    common_name TEXT NOT NULL,
    scientific_name TEXT NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status TEXT NOT NULL
);

CREATE TABLE sightings (
    sighting_id UUID PRIMARY KEY,
    ranger_id UUID REFERENCES rangers(ranger_id),
    species_id UUID REFERENCES species(species_id),
    sighting_time TIMESTAMP NOT NULL,
    location TEXT NOT NULL,
    notes TEXT
);


CREATE INDEX idx_sightings_ranger ON sightings(ranger_id);
CREATE INDEX idx_sightings_species ON sightings(species_id);

