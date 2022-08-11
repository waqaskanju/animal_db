/*Queries that provide answers to the questions from all projects.*/

/* SELECT * from animals WHERE name = 'Luna'; */
SELECT  * FROM public.animals WHERE name LIKE '%mon'

SELECT  name FROM public.animals WHERE date_of_birth between '01-01-2016' and '01-01-2019';

SELECT  name FROM public.animals WHERE neutered = 'Yes' AND escape_attempts<3

SELECT  date_of_birth FROM public.animals where name='Agumon' or name='Pikachu'

SELECT  name, escape_attempts FROM public.animals where weight_kg > 10.5

SELECT  * FROM public.animals WHERE neutered='yes'

SELECT  * FROM public.animals WHERE name!='Gabumon'

SELECT  * FROM public.animals WHERE weight_kg>=10.4 and weight_kg<=17.3

/* Project 2 answer questions */

/* Total Animals */
select count(*) AS total_animals from animals


/* Not escapted */

SELECT count(escape_attempts) as not_escpated
	FROM public.animals WHERE escape_attempts=0;

/* Average weigth */

select avg(weight_kg) as average_weight from animals;

/* Max escape */

select neutered, max(escape_attempts) from animals Group By neutered;

/* Min and Max weight */

select neutered, min (weight_kg), max(weight_kg) from animals Group By neutered;


/* Avg Escape attempts  by birth between 1990 and 2000*/

select neutered, avg(escape_attempts) from animals WHERE date_of_birth between '01-01-1990' and '01-01-2000' Group By neutered;


