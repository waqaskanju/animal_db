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