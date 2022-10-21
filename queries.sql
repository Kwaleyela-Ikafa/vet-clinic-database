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

------
SELECT owner_id, name, full_name FROM owners JOIN animals ON owners.id = animals.owner_id WHERE owners.full_name = 'Melody Pond';

------
SELECT * FROM animals JOIN species ON species.id = animals.species_id WHERE species.name = 'Pokemon';

------
SELECT * FROM owners FULL OUTER JOIN animals ON owners.id = animals.owner_id;

------
SELECT species.name, COUNT(*) FROM species JOIN animals ON species.id = animals.species_id GROUP BY species.name;

------
SELECT * FROM animals INNER JOIN owners ON animals.owner_id = owners.id INNER JOIN species ON species.id = animals.species_id WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

------
SELECT * FROM animals JOIN owners ON owners.id = animals.owner_id WHERE owners.full_name = 'Dean Winchester' and animals.escape_attempts = 0;

------
SELECT owners.full_name, COUNT(*) FROM animals JOIN owners ON owners.id = animals.owner_id GROUP BY owners.full_name ORDER BY COUNT DESC LIMIT 1;

------

-- Join Tables queries

SELECT vets.name, animals.name AS animal_name, visits.date_of_visit AS last_visit FROM animals INNER JOIN visits ON animals.id = visits.animal_id INNER JOIN vets ON vets.id = visits.vet_id where vets.name='William Tatcher' ORDER BY  date_of_visit DESC LIMIT 1 ; 

----
SELECT vets.name, COUNT(visits.date_of_visit) AS number_of_visits FROM visits INNER JOIN vets ON vets.id = visits.vet_id WHERE vets.name='Stephanie Mendez' GROUP BY vets.name;

----
SELECT specialization.species_id, specialization.vet_id, vets.name, species.name AS species_name FROM specialization FULL OUTER JOIN species ON species.id = specialization.species_id FULL OUTER JOIN vets ON vets.id = specialization.vet_id;

------
SELECT vets.name , animals.name AS animal_name, visits.date_of_visit as visit_date FROM animals INNER JOIN visits ON animals.id = visits.animal_id INNER JOIN vets ON vets.id = visits.vet_id WHERE vets.name='Stephanie Mendez' AND  date_of_visit BETWEEN '2020-04-01' And '2020-08-30'; 

----
SELECT animals.name AS animal_name, COUNT(visits.date_of_visit) AS number_of_visits from visits INNER JOIN animals ON animals.id = visits.animal_id GROUP BY animals.name ORDER BY COUNT(visits.date_of_visit) DESC LIMIT 1 ;

----
SELECT vets.name, animals.name as animal_name, visits.date_of_visit AS first_visit FROM animals INNER JOIN visits ON animals.id = visits.animal_id INNER JOIN vets ON vets.id = visits.vet_id WHERE vets.name='Maisy Smith' ORDER BY  date_of_visit ASC limit 1;   

----
SELECT animals.id AS animal_id, animals.name AS animal_name, animals.date_of_birth, vets.id AS vet_id,  vets.name AS vet_name, vets.age AS vet_age, date_of_visit FROM visits INNER JOIN animals ON animals.id = visits.animal_id INNER JOIN vets ON vets.id = visits.vet_id;

----
SELECT vets.name, COUNT(*) FROM visits JOIN vets ON vets.id = visits.vet_id JOIN specialization ON specialization.vet_id = visits.vet_id WHERE specialization.species_id IS NULL GROUP BY vets.name;

----
SELECT vets.name, species.name AS species_name, COUNT(species.name) FROM visits LEFT JOIN animals ON animals.id = visits.animal_id  JOIN vets ON vets.id = visits.vet_id JOIN species ON species.id = animals.species_id WHERE vets.name = 'Maisy Smith' GROUP BY vets.name, species.name ORDER BY COUNT DESC LIMIT 1;