
CREATE TABLE animals (
  id INT PRIMARY KEY NOT NULL,
  name VARCHAR(100),
  date_of_birth DATE,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg NUMERIC(10,2)
);

ALTER TABLE animals ADD COLUMN species VARCHAR(100);
