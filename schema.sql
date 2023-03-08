/* Database schema to keep the structure of entire database. */

/* Project - create animals table. */
CREATE DATABASE vet_clinic;

CREATE TABLE animals (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  date_of_birth DATE,
  escape_attempts INTEGER,
  neutered BOOLEAN,
  weight_kg DECIMAL,
);

/* Project - query and update animals table */
ALTER TABLE animals
ADD species varchar(50);

/* Project - query multiple tables */
CREATE TABLE owners(
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(50),
    age INT,
    PRIMARY KEY(id)
);
CREATE TABLE species(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50),
    PRIMARY KEY(id)
);

\ d animals
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals
ADD COLUMN species_id INT CONSTRAINT species_fk REFERENCES species (id);
ALTER TABLE animals
ADD COLUMN owner_id INT CONSTRAINT owner_fk REFERENCES owners (id);

/* Project - add join tables */
CREATE TABLE vets(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50),
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY(id)
);

CREATE TABLE specializations(
    species_id INT,
    vet_id INT,
    PRIMARY KEY(species_id, vet_id)
);

CREATE TABLE visits(
    animal_id INT,
    vet_id INT,
    visit_date DATE,
    PRIMARY KEY(animal_id, vet_id, visit_date)
);

-- Performance Aduit starts here

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);


-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, visit_date) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

CREATE INDEX ON owners(email);
CREATE INDEX vet_index ON visits(vet_id);
CREATE INDEX animal_index ON visits(animal_id);

