
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

