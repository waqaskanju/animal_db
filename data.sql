/* Populate database with sample data. */

/* INSERT INTO animals (name) VALUES ('Luna');
INSERT INTO animals (name) VALUES ('Daisy');
INSERT INTO animals (name) VALUES ('Charlie'); */
INSERT INTO public.animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES (1,'Agumon', '02-03-2020', 0, 'yes', 10.23);

INSERT INTO public.animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES (2,'Gabumon', '11-15-2018', 2, 'yes', 8);

INSERT INTO public.animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES (3,'Pikachu', '01-07-2021', 1, 'No', 15.04);

INSERT INTO public.animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES (4,'Devimon', '05-12-2017', 5, 'Yes', 11);

/* Project 2 */
INSERT INTO public.animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES (5,'Charmander', '02-8-2020', 0, 'No', 11);

INSERT INTO public.animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES (6,'Plantmon', '11-15-2021', 2, 'Yes', 5.7);

INSERT INTO public.animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES (7,'Squirtle', '4-2-1993', 3, 'No', 12.13);

INSERT INTO public.animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES (8,'Angemon', '6-12-2005', 1, 'Yes', 45);

INSERT INTO public.animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES (9,'Boarmon', '6-07-2005', 7, 'Yes', 20.4);

	INSERT INTO public.animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES (10,'Blossom', '10-13-1998', 3, 'Yes', 17);

	INSERT INTO public.animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES (11,'Ditto', '5-14-2022', 4, 'Yes', 22);


	/* Update 1 */
Begin;
UPDATE public.animals
	SET  species='unspecified'
ROLLBACK;


/* Update 2 */
BEGIN;
UPDATE public.animals
    SET species ='digimon' WHERE name LIKE '%mon';
UPDATE public.animals
    SET species ='pokemon' WHERE species IS NULL;
COMMIT;


/*  Query 3  delete transaction */

BEGIN;
delete from animals;
ROLLBACK;

/* Query 4  transtions, save point, delete and roll back  */

BEGIN;
DELETE from animals WHERE date_of_birth>'01-01-2022';
SAVEPOINT birth_2022;
update animals SET weight_kg = weight_kg*(-1);
RollBack TO birth_2022;
update animals SET weight_kg = weight_kg*(-1) WHERE weight_kg<0;


/* Project 3  Queriing Multiple tables*/

 /* Insert data into Owners table */

INSERT INTO public.owners(
	full_name, age)
	VALUES ( 'Sam Smith', 34);

 INSERT INTO public.owners(
	full_name, age)
	VALUES ( 'Jennifer Orwell', 19);
    
INSERT INTO public.owners(
	full_name, age)
	VALUES ( 'Bob', 45);
    
    
INSERT INTO public.owners(
	full_name, age)
	VALUES ( 'Melody Pond', 77);
    
    
INSERT INTO public.owners(
	full_name, age)
	VALUES ( 'Dean Winchester', 14);
    
    
INSERT INTO public.owners(
	full_name, age)
	VALUES ( 'Jodie Whittaker', 38);
    

/* Insert data into  species table  */

INSERT INTO public.species( name)
	VALUES ( 'Pokemon');
    
INSERT INTO public.species( name)
	VALUES ( 'Digimon');


/* Add digimon where the name ends with mon */

BEGIN;
UPDATE public.animals
    SET species_id =1 WHERE name LIKE '%mon';
COMMIT:


/* All other animals to Pokemon */
BEGIN;
UPDATE public.animals
    SET species_id =2 WHERE species_id IS NULL;
COMMIT;


/* Modification in animal table to add owners; */

BEGIN;

UPDATE public.animals
	SET  owner_id=2
	WHERE name='Gabumon' OR name='Pikachu';
    
 UPDATE public.animals
	SET  owner_id=1
	WHERE name='Agumon';   
    
UPDATE public.animals
	SET  owner_id=3
	WHERE name='Devimon' OR name='Plantmon';
    
UPDATE public.animals
	SET  owner_id=4
	WHERE name='Charmander' OR name='Squirtle' OR name='Blossom';
    
UPDATE public.animals
	SET  owner_id=5
	WHERE name='Angemon' OR name='Boarmon';    
select * from animals;

commit;


/* insert data in vets table */
INSERT INTO public.vets(
	name, age, date_of_graduation)
	VALUES ('William Tatcher', 45, '04-23-2000');


INSERT INTO public.vets(
	name, age, date_of_graduation)
	VALUES ('Maisy Smith', 26, '01-17-2019');



INSERT INTO public.vets(
	name, age, date_of_graduation)
	VALUES ('Stephanie Mendez', 64, '05-04-1981');


INSERT INTO public.vets(
	name, age, date_of_graduation)
	VALUES ('Jack Harkness', 38, '06-08-2008');


/* Insert data in specialization */

/* Vet William Tatcher is specialized in Pokemon */
INSERT INTO public.specializations(
	vets_id, species_id)
	VALUES (1, 1);

/* Vet Stephanie Mendez is specialized in Digimon */
INSERT INTO public.specializations(
	vets_id, species_id)
	VALUES (3, 1);

/* Vet Stephanie Mendez is specialized in Pokemon. */
INSERT INTO public.specializations(
	vets_id, species_id)
	VALUES (3, 2);

/* Vet Jack Harkness is specialized in Digimon. */
INSERT INTO public.specializations(
	vets_id, species_id)
	VALUES (4, 1);


/* Insert data into visits */

INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (1, 1, '05-24-2020');

INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (1, 3, '07-22-2020');

INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (2, 4, '02-02-2021');

INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (3, 2, '01-05-2020');


INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (3, 2, '03-08-2020');

INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (3, 2, '05-14-2020');

INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (4, 3, '05-04-2021');

INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (5, 4, '02-24-2021');


INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (6, 2, '12-21-2019');

INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (6, 1, '08-10-2020');

INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (6, 2, '04-07-2021');

INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (7, 3, '09-29-2019');

INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (8, 4, '10-10-2020');

INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (8, 4, '11-04-2020');


INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (9, 2, '01-24-2019');


INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (9, 2, '05-15-2019');



INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (9, 2, '02-27-2020');



INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (9, 2, '08-03-2020');


INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (10, 3, '05-24-2020');


INSERT INTO public.visits(
	animals_id, vets_id, date_of_visit)
	VALUES (10, 1, '01-11-2021');	


/* Added three time */
-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';