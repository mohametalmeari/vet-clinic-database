
SELECT * FROM animals;
SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals WHERE weight_kg >= 10.4 and weight_kg <= 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = - weight_kg;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = - weight_kg WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;

SELECT
    neutered, MAX(escape_attempts)
FROM
    animals
GROUP BY neutered;

SELECT
    species, MAX(weight_kg), MIN(weight_kg)
FROM
    animals
GROUP BY species;

SELECT
    species, AVG(escape_attempts)
FROM
    animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;

SELECT * FROM owners;
SELECT * FROM species;

SELECT
    name,
    full_name
FROM
    animals
INNER JOIN owners
    ON animals.owner_id = owners.id
WHERE full_name = 'Melody Pond';

SELECT
    animals.name,
    species.name AS Type
FROM
    animals
INNER JOIN species
    ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

SELECT
    owners.full_name,
    animals.name
FROM
    animals
FULL OUTER JOIN owners
    ON animals.owner_id = owners.id;

SELECT
    species.name,
    COUNT(*) AS count
FROM
    animals
INNER JOIN species
    ON animals.species_id = species.id
GROUP BY
    species.name;

SELECT
    owners.full_name,
    animals.name,
    species.name
FROM
    animals
INNER JOIN owners
    ON animals.owner_id = owners.id
INNER JOIN species
    ON animals.species_id = species.id
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon' ;

SELECT
    owners.full_name,
    animals.name
FROM
    animals
INNER JOIN owners
    ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

SELECT
    owners.full_name,
    COUNT(*) AS count
FROM
    animals
INNER JOIN owners
    ON animals.owner_id = owners.id
GROUP BY
    owners.full_name
ORDER BY
    count DESC
LIMIT 1;

SELECT * FROM vets;
SELECT * FROM specializations;
SELECT * FROM visits;

SELECT
    vets.name,
    animals.name,
    visits.date_of_visit
FROM
    visits
INNER JOIN vets
    ON visits.vets_id = vets.id
INNER JOIN animals
    ON visits.animals_id = animals.id
WHERE vets.name = 'William Tatcher'
ORDER BY
    visits.date_of_visit DESC
LIMIT 1;

SELECT
    animals.name
FROM
    visits
INNER JOIN vets
    ON visits.vets_id = vets.id
INNER JOIN animals
    ON visits.animals_id = animals.id
WHERE vets.name = 'Stephanie Mendez'
GROUP BY
    animals.name;

SELECT
    vets.name AS Vets,
    species.name AS Specialties
FROM
    specializations
FULL OUTER JOIN vets
    ON specializations.vets_id = vets.id
FULL OUTER JOIN species
    ON specializations.species_id = species.id;

SELECT
    vets.name AS Vets,
    animals.name AS Animals,
    visits.date_of_visit
FROM
    visits
JOIN vets
    ON visits.vets_id = vets.id
JOIN animals
    ON visits.animals_id = animals.id
WHERE vets.name = 'Stephanie Mendez' 
    AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

SELECT
    animals.name AS animal,
    COUNT(*) AS count
FROM
    visits
JOIN vets
    ON visits.vets_id = vets.id
JOIN animals
    ON visits.animals_id = animals.id
GROUP BY
    animals.name
ORDER BY
    count DESC
LIMIT 1;

SELECT
    vets.name AS Vet,
    animals.name AS Animal,
    visits.date_of_visit
FROM
    visits
JOIN vets
    ON visits.vets_id = vets.id
JOIN animals
    ON visits.animals_id = animals.id
WHERE vets.name = 'Maisy Smith'
ORDER BY
    visits.date_of_visit ASC
LIMIT 1;

SELECT
    animals.name AS animal,
    species.name AS species,
    owners.full_name AS owner,
    animals.date_of_birth,
    animals.escape_attempts,
    animals.neutered,
    animals.weight_kg,
    vets.name AS vet,
    vets.age AS vet_age,
    vets.date_of_graduation,
    visits.date_of_visit
FROM
    visits
JOIN vets
    ON visits.vets_id = vets.id
JOIN animals
    ON visits.animals_id = animals.id
JOIN owners
    ON animals.owner_id = owners.id
JOIN species
    ON animals.species_id = species.id
ORDER BY
    visits.date_of_visit DESC
LIMIT 1;

SELECT
    COUNT(*) AS visits
FROM
    visits
JOIN vets
    ON visits.vets_id = vets.id
JOIN animals
    ON visits.animals_id = animals.id
JOIN specializations
    ON specializations.vets_id = vets.id
WHERE specializations.species_id = animals.species_id;

SELECT
    species.name,
    COUNT(*) AS visits
FROM
    visits
JOIN vets
    ON visits.vets_id = vets.id
JOIN animals
    ON visits.animals_id = animals.id
JOIN species
    ON animals.species_id = species.id
WHERE vets.name = 'Maisy Smith'
GROUP BY
    species.name
ORDER BY
    visits DESC
LIMIT 1;

EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animals_id = 4;

EXPLAIN ANALYZE SELECT COUNT(*) FROM visits_animal_4;

EXPLAIN ANALYZE SELECT * FROM visits where vets_id = 2;

EXPLAIN ANALYZE SELECT * FROM visits_vet_2;

EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';

EXPLAIN ANALYZE  SELECT * FROM owner_18327;
