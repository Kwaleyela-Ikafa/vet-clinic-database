/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31'; 
SELECT name FROM animals WHERE neutered = '1' AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu'; 
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5 ;
SELECT * FROM animals WHERE neutered = '1';
SELECT * FROM animals WHERE name NOT like 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

------
BEGIN;
UPDATE animals
SET species = 'unspecified';
ROLLBACK;

------

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

UPDATE animals
SET species = 'pokemon'
WHERE species is null;
COMMIT;

------
BEGIN;
DELETE FROM animals;
ROLLBACK;

------
BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;

UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK SP1;

UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;

------
SELECT COUNT(name)
FROM animals;

------
SELECT COUNT(name)
FROM animals
WHERE escape_attempts = 0;

------
SELECT AVG(weight_kg)
FROM animals;

------
SELECT neutered, escape_attempts
from animals
WHERE escape_attempts = (
  SELECT MAX(escape_attempts)
  from animals
);

------
SELECT species,
MIN(weight_kg),
MAX(weight_kg)
FROM animals
GROUP BY species;

------
SELECT species, AVG(escape_attempts)
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01'
GROUP BY species;
