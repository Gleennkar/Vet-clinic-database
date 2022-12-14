/* Populate database with sample data. */

/* Project - create animals table. */
 INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)
 VALUES('Agumon', '2020-02-03',0,True,10.23);

 INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)
 VALUES('Gabumon', '2018-11-15',2,True,8);

INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)
 VALUES(' Pikachu', '2021-01-07',1,False,15.04);

 INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)
 VALUES(' Devimon', '2017-05-17',5,True,11);

/* Project - query and update animals table */
INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)
 VALUES(' Charmander', '2020-02-08',0,False,-11);

INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)
 VALUES(' Plantmon', '2021-11-15',2,True,-5);

 INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)
 VALUES(' Squirtle', '1993-04-02',3,False,-12.13);

 INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)
 VALUES(' Angemon', '2005-06-12',1,True,-45);

 INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)
 VALUES(' Boarmon', '2005-06-07',7,True,20.4);

 INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)
 VALUES(' Blossom', '1998-10-13',3,True,17);

 INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)
 VALUES(' Ditto', '2022-05-14',4,True,22);

 /* Project - query multiple tables */

 INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age)
VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age)
VALUES ('Bob', 45);
INSERT INTO owners (full_name, age)
VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age)
VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age)
VALUES ('Jodie Whittaker', 38);

INSERT INTO species (name)
VALUES ('Pokemon');
INSERT INTO species (name)
VALUES ('Digimon');

UPDATE animals
SET species_id = (
        SELECT id
        FROM species
        WHERE name = 'Digimon'
    )
WHERE name LIKE '%mon';
UPDATE animals
SET species_id = (
        SELECT id
        FROM species
        WHERE name = 'Pokemon'
    )
WHERE name NOT LIKE '%mon';

UPDATE animals
SET owner_id = (
        SELECT id
        FROM owners
        WHERE full_name = 'Sam Smith'
    )
WHERE name = 'Agumon';
UPDATE animals
SET owner_id = (
        SELECT id
        FROM owners
        WHERE full_name = 'Jennifer Orwell'
    )
WHERE name in ('Gabumon', 'Pikachu');
UPDATE animals
SET owner_id = (
        SELECT id
        FROM owners
        WHERE full_name = 'Bob'
    )
WHERE name in ('Devimon', 'Plantmon');
UPDATE animals
SET owner_id = (
        SELECT id
        FROM owners
        WHERE full_name = 'Melody Pond'
    )
WHERE name in ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals
SET owner_id = (
        SELECT id
        FROM owners
        WHERE full_name = 'Dean Winchester'
    )
WHERE name in ('Angemon', 'Boarmon');

/* Project - add join tables */

INSERT INTO vets ( name, age, date_of_graduation)
VALUES('William Tatchwe', 45, '2000-04-23');

INSERT INTO vets ( name, age, date_of_graduation)
VALUES('Maisy Smith', 26, '2019-01-17');

INSERT INTO vets ( name, age, date_of_graduation)
VALUES('Stephanie Mendez', 64, '1981-05-04');

INSERT INTO vets ( name, age, date_of_graduation)
VALUES('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations(species_id, vet_id)
VALUES (
        (
            SELECT id
            FROM species
            WHERE name = 'Pokemon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'William Tatcher'
        )
    );
INSERT INTO specializations (species_id, vet_id)
VALUES (
        (
            SELECT id
            FROM species
            WHERE name = 'Digimon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Stephanie Mendez'
        )
    ),
    (
        (
            SELECT id
            FROM species
            WHERE name = 'Pokemon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Stephanie Mendez'
        )
    );
INSERT INTO specializations (species_id, vet_id)
VALUES (
        (
            SELECT id
            FROM species
            WHERE name = 'Digimon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Jack Harkness'
        )
    );
    

    INSERT INTO
    visits(animal_id, vet_id, visit_date)
VALUES
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = 'Agumon'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = ' William Tatcher'
        ),
        '2020-05-24'
    );

INSERT INTO
    visits(animal_id, vet_id, visit_date)
VALUES
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = 'Agumon'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = 'Stephanie Mendez'
        ),
        '2020-07-22'
    );


    INSERT INTO
    visits(animal_id, vet_id, visit_date)
VALUES
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = 'Gabumon'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = 'Jack Harkness'
        ),
        '2021-02-02'
    );

     INSERT INTO
    visits(animal_id, vet_id, visit_date)
VALUES
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = ' Pikachu'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = 'Maisy Smith'
        ),
        '2020-01-5'
    );

    INSERT INTO
    visits(animal_id, vet_id, visit_date)
VALUES
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = ' Pikachu'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = 'Maisy Smith'
        ),
        '2020-03-8'
    );

INSERT INTO
    visits(animal_id, vet_id, visit_date)
VALUES
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = ' Pikachu'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = 'Maisy Smith'
        ),
        '2020-05-14'
    );

     INSERT INTO
   visits(animal_id, vet_id, visit_date)
VALUES
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = ' Devimon'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = 'Stephanie Mendez'
        ),
        '2019-12-21'
    );

     INSERT INTO
   visits(animal_id, vet_id, visit_date)
VALUES
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = ' Charmander'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = 'Jack Harkness'
        ),
        '2019-12-21'
    );

    INSERT INTO
   visits(animal_id, vet_id, visit_date)
VALUES
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = ' Plantmon'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = 'Maisy Smith'
        ),
        '2019-12-21'
    );

INSERT INTO
   visits(animal_id, vet_id, visit_date)
VALUES
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = ' Plantmon'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = ' William Tatcher'
        ),
        '2020-08-10'
    );

INSERT INTO
   visits(animal_id, vet_id, visit_date)
VALUES
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = ' Plantmon'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = 'Maisy Smith'
        ),
        '2021-04-07'
    );

INSERT INTO
    visits(animal_id, vet_id, visit_date)
VALUES
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = ' Squirtle'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = 'Stephanie Mendez'
        ),
        '2019-09-29'
    );

INSERT INTO
    visits(animal_id, vet_id, visit_date)
VALUES
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = ' Angemon'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = 'Jack Harkness'
        ),
        '2020-10-03'
    );

INSERT INTO
    visits(animal_id, vet_id, visit_date)
VALUES
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = ' Angemon'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = 'Jack Harkness'
        ),
        '2020-11-04'
    );

INSERT INTO
   visits(animal_id, vet_id, visit_date)
VALUES
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = ' Boarmon'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = 'Maisy Smith'
        ),
        '2019-01-24'
    );

INSERT INTO
    visits(animal_id, vet_id, visit_date)
VALUES
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = ' Boarmon'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = 'Maisy Smith'
        ),
        '2019-05-15'
    );

INSERT INTO
    visits(animal_id, vet_id, visit_date)
VALUES
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = ' Boarmon'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = 'Maisy Smith'
        ),
        '2020-02-27'
    );

INSERT INTO
    visits(animal_id, vet_id, visit_date)
VALUES
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = ' Boarmon'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = 'Maisy Smith'
        ),
        '2020-08-03'
    );

INSERT INTO
    visits(animal_id, vet_id, visit_date)
VALUES
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = ' Blossom'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = 'Stephanie Mendez'
        ),
        '2020-05-24'
    );

INSERT INTO
    visits(animal_id, vet_id, visit_date)
VALUES
    (
        (
            SELECT
                id
            FROM
                animals
            WHERE
                name = ' Blossom'
        ),
        (
            SELECT
                id
            FROM
                vets
            WHERE
                name = ' William Tatcher'
        ),
        '2021-01-11'
    );

