/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name like '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT * FROM animals WHERE neutered=true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name ='piachu' OR name ='Agumon';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered=true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN '10.4' AND '17.3';

BEGIN;
  update animals
  set species = 'unspecified';
  ROLLBACK;

  BEGIN;
  update animals
  set species = 'digimon' where name like '%mon';
  update animals
  set species = 'pokemon' where name not like '%mon';
  COMMIT;

  BEGIN;
  DELETE from animals;
--   the ROLLBACK should be after executing the delete
  ROLLBACK;

  BEGIN;
  DELETE FROM animals WHERE date_of_birth > '2022-01-01';
  SAVEPOINT delete_2022;
  UPDATE animals
  SET weight_kg = weight_kg * -1;
  ROLLBACK TO SAVEPOINT delete_2022;
  UPDATE animals
  SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
  COMMIT;
  

SELECT count(*) FROM animals;
SELECT count(*) FROM animals WHERE escape_attempts > 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) from animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-30' GROUP BY species;
