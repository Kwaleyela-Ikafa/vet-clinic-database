/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id              INT  GENERATED ALWAYS AS IDENTITY,
    name            VARCHAR(100),
    date_of_birth   DATE,
    escape_attempts INT,
    neutered        BIT,
    weight_kg       FLOAT
);

ALTER TABLE animals ADD species VARCHAR(100);

CREATE TABLE OWNERS(
ID        INT   GENERATED ALWAYS AS IDENTITY, 
FULL_NAME VARCHAR(100) NOT NULL,
AGE       INT   NOT NULL,
PRIMARY KEY (ID)
);

CREATE TABLE SPECIES(
ID   INT   GENERATED ALWAYS AS IDENTITY, 
NAME VARCHAR(100) NOT NULL,
PRIMARY KEY (ID)         
);

ALTER TABLE animals 
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id INT;

ALTER TABLE animals
ADD FOREIGN KEY (species_id)
REFERENCES species(id)
ON DELETE CASCADE;

ALTER TABLE animals
ADD COLUMN owner_id INT;

ALTER TABLE animals
ADD FOREIGN KEY (owner_id)
REFERENCES owners(id)
ON DELETE CASCADE;

