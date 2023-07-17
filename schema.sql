CREATE TABLE animals (
  id INT PRIMARY KEY NOT NULL,
  name VARCHAR(100),
  date_of_birth DATE,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg NUMERIC(10,2)
);

ALTER TABLE animals ADD COLUMN species VARCHAR(100);

Alter Table animals Drop id;
Alter Table animals Drop species;
ALTER TABLE animals ADD id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY;

ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD owner_id INT;

CREATE TABLE owners (
  id INT GENERATED ALWAYS AS IDENTITY,
  full_name VARCHAR(100),
  age INT,
  PRIMARY KEY(id)
);

CREATE TABLE species (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100),
  PRIMARY KEY(id)
);

ALTER TABLE animals 
ADD CONSTRAINT species_constraint
FOREIGN KEY (species_id) 
REFERENCES species (id);

ALTER TABLE animals 
ADD CONSTRAINT owners_constraint
FOREIGN KEY (owner_id) 
REFERENCES owners (id);

CREATE TABLE vets (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100),
  age INT,
  date_of_graduation DATE,
  PRIMARY KEY(id)
);

CREATE TABLE specializations (
  vets_id INT,
  species_id INT,
  PRIMARY KEY(vets_id, species_id)
);

CREATE TABLE visits (
  vets_id INT,
  animals_id INT,
  date_of_visit DATE,
  PRIMARY KEY(vets_id, animals_id, date_of_visit)
);

ALTER TABLE specializations 
ADD CONSTRAINT specializations_species_constraint
FOREIGN KEY (species_id) 
REFERENCES species (id);
ALTER TABLE specializations 
ADD CONSTRAINT specializations_vets_constraint
FOREIGN KEY (vets_id) 
REFERENCES vets (id);

ALTER TABLE visits 
ADD CONSTRAINT visits_vets_constraint
FOREIGN KEY (vets_id) 
REFERENCES vets (id);
ALTER TABLE visits 
ADD CONSTRAINT visits_animals_constraint
FOREIGN KEY (animals_id) 
REFERENCES animals (id);

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE TABLE visits_animal_4 (
  vets_id INT,
  animals_id INT,
  date_of_visit DATE,
  PRIMARY KEY(vets_id, animals_id, date_of_visit)
);
--or:
CREATE TABLE visits_animal_4 AS
SELECT *
FROM visits
WHERE animal_id = 4;


CREATE TABLE visits_vet_2 (
  vets_id INT,
  animals_id INT,
  date_of_visit DATE,
  PRIMARY KEY(vets_id, animals_id, date_of_visit)
);

CREATE TABLE owner_18327 (
  id INT GENERATED ALWAYS AS IDENTITY,
  full_name VARCHAR(100),
  age INT,
  email VARCHAR(120),
  PRIMARY KEY(id)
);