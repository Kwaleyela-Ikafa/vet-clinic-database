/* Populate database with sample data. */

INSERT INTO ANIMALS (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Agumon', '2020-02-03', 0, '1', 10.23),('Gabumon', '2018-11-15', 2,'1', 8), ('Pikachu', '2021-01-07', 1, '0', 15.04), ('Devimon', '2017-05-12', 5, '1', 11);

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Charmander','2020-02-08', 0, '1', -11),
       ('Plantmon','2021-11-15', 2, '1', -5.7),
       ('Squirtle','1993-04-02', 3, '0', -12.13),
       ('Angemon','2005-06-12', 1, '1', -45),
       ('Boarmon','2005-06-07', 7, '1', 20.4),
       ('Blossom','1998-10-13', 3, '1', 17),
       ('Ditto','2022-05-14', 4, '1', 22);

INSERT INTO owners(full_name, age)
VALUES ('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species(name) VALUES ('Pokemon'), ('Digimon');

UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon') WHERE name LIKE '%mon';

UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon') WHERE name NOT LIKE '%mon';

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name IN ('Charmander', 'Squirtle','Blossom');

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name IN ('Angemon', 'Boarmon');

-----
INSERT INTO VETS(NAME, AGE, DATE_OF_GRADUATION)
VALUES('William Tatcher', 45, '2000-04-23'),
      ('Maisy Smith', 26, '2019-01-17'),
      ('Stephanie Mendez', 64, '1981-05-04'),
      ('Jack Harkness', 38, '2008-06-08');

-----
INSERT INTO SPECIALIZATION(SPECIES_ID, VET_ID) VALUES((SELECT ID FROM SPECIES WHERE NAME = 'Pokemon'), (SELECT ID FROM VETS WHERE NAME = 'William Tatcher'));

INSERT INTO SPECIALIZATION(species_id, vet_id) VALUES ((SELECT id FROM species WHERE name = 'Pokemon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez')),
                                                      ((SELECT id FROM species WHERE name = 'Digimon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'));

INSERT INTO SPECIALIZATION(SPECIES_ID, VET_ID) VALUES((SELECT ID FROM SPECIES WHERE NAME = 'Digimon'), (SELECT ID FROM VETS WHERE NAME = 'Jack Harkness' ));

-----

INSERT INTO VISITS(ANIMAL_ID, VET_ID, DATE_OF_VISITS) VALUES ((SELECT ID FROM ANIMALS WHERE NAME = 'Agumon'), (SELECT ID FROM VETS WHERE NAME = 'William Tatcher'), '2020-05-24');

INSERT INTO VISITS(ANIMAL_ID, VET_ID, DATE_OF_VISIT) VALUES ((SELECT ID FROM ANIMALS WHERE NAME = 'Agumon'), (SELECT ID FROM VETS WHERE NAME = 'Stephanie Mendez'), '2020-07-22');

INSERT INTO VISITS(ANIMAL_ID, VET_ID, DATE_OF_VISIT) VALUES ((SELECT ID FROM ANIMALS WHERE NAME = 'Gabumon'), (SELECT ID FROM VETS WHERE NAME = 'Jack Harkness'), '2021-02-02');

INSERT INTO VISITS(ANIMAL_ID, VET_ID, DATE_OF_VISIT) VALUES ((SELECT ID FROM ANIMALS WHERE NAME = 'Pikachu'), (SELECT ID FROM VETS WHERE NAME = 'Maisy Smith'), '2020-01-05'),
                                                            ((SELECT ID FROM ANIMALS WHERE NAME = 'Pikachu'), (SELECT ID FROM VETS WHERE NAME = 'Maisy Smith'), '2020-03-08'),
                                                            ((SELECT ID FROM ANIMALS WHERE NAME = 'Pikachu'), (SELECT ID FROM VETS WHERE NAME = 'Maisy Smith'), '2020-05-14');

INSERT INTO VISITS(ANIMAL_ID, VET_ID, DATE_OF_VISIT) VALUES ((SELECT ID FROM ANIMALS WHERE NAME = 'Devimon'), (SELECT ID FROM VETS WHERE NAME = 'Stephanie Mendez'), '2021-05-04');

INSERT INTO VISITS(ANIMAL_ID, VET_ID, DATE_OF_VISIT) VALUES ((SELECT ID FROM ANIMALS WHERE NAME = 'Charmander'), (SELECT ID FROM VETS WHERE NAME = 'Jack Harkness'), '2021-02-24');

INSERT INTO VISITS(ANIMAL_ID, VET_ID, DATE_OF_VISIT) VALUES ((SELECT ID FROM ANIMALS WHERE NAME = 'Plantmon'), (SELECT ID FROM VETS WHERE NAME = 'Maisy Smith'), '2019-12-21'),
                                                            ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-08-10'),
                                                            ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2021-04-07');

INSERT INTO VISITS(ANIMAL_ID, VET_ID, DATE_OF_VISIT) VALUES((SELECT ID FROM ANIMALS WHERE NAME = 'Squirtle'), (SELECT ID FROM VETS WHERE NAME = 'Stephanie Mendez'), '2019-09-29');

INSERT INTO VISITS(ANIMAL_ID, VET_ID, DATE_OF_VISIT) VALUES ((SELECT ID FROM ANIMALS WHERE NAME = 'Angemon'), (SELECT ID FROM VETS WHERE NAME = 'Jack Harkness'), '2020-10-03'),
                                                            ((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-11-04');

INSERT INTO VISITS(ANIMAL_ID, VET_ID, DATE_OF_VISIT) VALUES ((SELECT ID FROM ANIMALS WHERE NAME = 'Boarmon'), (SELECT ID FROM VETS WHERE NAME = 'Maisy Smith'), '2019-01-24'),
                                                            ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'),  '2019-05-15'),
                                                            ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'),  '2020-02-27'),
                                                            ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-08-03');

INSERT INTO VISITS(ANIMAL_ID, VET_ID, DATE_OF_VISIT) VALUES ((SELECT ID FROM ANIMALS WHERE NAME = 'Blossom'), (SELECT ID FROM VETS WHERE NAME = 'Stephanie Mendez'), '2020-05-24'),
                                                            ((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2021-01-11');
