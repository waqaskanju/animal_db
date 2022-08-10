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

