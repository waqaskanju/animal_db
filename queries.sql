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



/* Project 3 Queriesy Multiple Tables */


/* Which animals belong to  Melody Pond*/
select animals.id,animals.name, owners.full_name from animals 
        inner join owners ON animals.owner_id = owners.id WHERE owners.full_name='Melody Pond';

/* Animals with species 'Pokemon */

select animals.id,animals.name,species.name from animals 
        inner join species ON animals.species_id = species.id WHERE species.name='Pokemon';

/* Animals with owners */

select animals.id,animals.name as animal, owners.full_name as owner from animals 
       right join owners ON animals.owner_id = owners.id;

/* Total animals per species */

	Select count(*) as TotalCount, species.name from animals
	inner join species on animals.species_id = species.id
	Group by species.name;

	/* Digimon owned by Jenefier */

	select animals.name as animal, species.name as species, owners.full_name as owner from animals 
       inner join species ON animals.species_id = species.id
       join owners ON animals.owner_id=owners.id
         WHERE species.name='Digimon' AND owners.full_name='Jennifer Orwell';
        
/* Animales owned by Dean Wincherter not escaped */
		select animals.name as animal, owners.full_name as owner from animals 
       join owners ON animals.owner_id=owners.id
         WHERE   owners.full_name='Dean Winchester' AND escape_attempts=0 ;


/* Who own the most animals */

select count(owner_id) as animals, owners.full_name as owner from animals inner join owners 
on animals.owner_id = owners.id
group by owners.full_name ORDER by animals DESC LIMIT 1;


/* Project 4  */


/* Who was the last animal seen by William Tatcher? */

select animals.name, max(date_of_visit) as date from visits 
inner join animals on visits.animals_id=animals.id
inner join vets on visits.vets_id = vets.id
where vets.name='William Tatcher' group by animals.name order by date DESC LIMIT 1;


/* How many different animals did Stephanie Mendez see? */

select animals.name as name from visits 
inner join animals on visits.animals_id=animals.id
inner join vets on visits.vets_id = vets.id
where vets.name='Stephanie Mendez' group by animals.name;


/* List all vets and their specialties, including vets with no specialties. */

select vets.name as name, species.name as specialization from vets 
 left join specializations on specializations.vets_id = vets.id
 left join species on specializations.species_id =species.id
;


/* List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020. */

select animals.name, visits.date_of_visit  as name from visits 
inner join animals on visits.animals_id=animals.id
inner join vets on visits.vets_id = vets.id
where vets.name='Stephanie Mendez' AND date_of_visit between '04-01-2020' AND '08-30-2020' 
group by visits.date_of_visit, animals.name;

/* What animal has the most visits to vets? */

select count(animals.name) as count ,animals.name as name from visits 
inner join animals on visits.animals_id=animals.id
inner join vets on visits.vets_id = vets.id
 group by animals.name order by count desc LIMIT 1;


 /* Who was Maisy Smith's first visit? */

 select animals.name, visits.date_of_visit as date from visits 
 join animals on visits.animals_id=animals.id
 join vets on visits.vets_id = vets.id
where vets.name='Maisy Smith' group by animals.name,visits.date_of_visit order by date ASC LIMIT 1 ;


/* Details for most recent visit: animal information, vet information, and date of visit. */

SELECT date_of_visit, animals.date_of_birth AS dob, animals.escape_attempts, animals.neutered, animals.weight_kg AS weight,
	vets.name AS vet_name, vets.age AS vet_age, vets.date_of_graduation
FROM visits
JOIN animals ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vets_id
ORDER BY date_of_visit
LIMIT 1;

/* How many visits were with a vet that did not specialize in that animal's species? */

SELECT COUNT(*)
FROM visits
JOIN animals ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vets_id
JOIN specializations ON specializations.vets_id = visits.vets_id
WHERE animals.species_id != specializations.species_id;


/* What specialty should Maisy Smith consider getting? Look for the species she gets the most. */

SELECT species.name as species, COUNT(*) from visits
join vets ON vets.id = visits.vets_id
JOIN animals ON animals.id = visits.animals_id
JOIN species ON species.id = animals.species_id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name ORDER by count DESC LIMIT 1;