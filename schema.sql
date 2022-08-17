/* Database schema to keep the structure of entire database. */

 CREATE DATABASE vet_clinic
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;

CREATE TABLE public.animals
(
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    date_of_birth date NOT NULL,
    escape_attempts integer NOT NULL,
    neutered boolean NOT NULL,
    weight_kg numeric NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.animals
    OWNER to postgres;

    /* Project 2 alter table add column */

    ALTER TABLE IF EXISTS public.animals
    ADD COLUMN species character varying(30) COLLATE pg_catalog."default";

    /* Project 3 query multiple tables */

ۜأ/* Create Owners table */

    CREATE TABLE public.owners
(
    id serial NOT NULL,
    full_name character varying(30) NOT NULL,
    age integer NOT NULL,

    PRIMARY KEY (id)
);

    ALTER TABLE IF EXISTS public.owners
    OWNER to postgres;

/* Create Species Table  */
    CREATE TABLE public.species
(
    id serial NOT NULL,
    name character varying(30) NOT NULL,
    PRIMARY KEY (id)
);

    ALTER TABLE IF EXISTS public.species
    OWNER to postgres;


    /* Remove Species column  from animale table*/

     ALTER TABLE animals DROP COLUMN species;


     /* Add Species_id column */

    ALTER TABLE animals add COLUMN species_id INTEGER REFERENCES species (id) 
    
    /* Add owners_id column */
  ALTER TABLE animals add COLUMN owner_id INTEGER REFERENCES owners (id)
  

  /* Project 4 */


  /* Add vets table */

     CREATE TABLE public.vets
(
    id serial NOT NULL,
    name character varying(30) NOT NULL,
    age integer  NOT NULL,
    date_of_graduation date NOT NULL,
    PRIMARY KEY (id)
);

    ALTER TABLE IF EXISTS public.vets
    OWNER to postgres;


    /* Create Specialization  Table */

  CREATE TABLE public.specializations
(
    id serial NOT NULL,
    vets_id INTEGER REFERENCES vets (id),
    species_id INTEGER REFERENCES species (id)
 );   

  ALTER TABLE IF EXISTS public.specializations
    OWNER to postgres;


/* Create Visit Table */

  CREATE TABLE public.visits
(
    id serial NOT NULL,
    animals_id INTEGER REFERENCES animals (id),
    vets_id INTEGER REFERENCES vets (id),
    date_of_visit date not null
 );   

  ALTER TABLE IF EXISTS public.visits
    OWNER to postgres;


    /* to optiime query */

     CREATE INDEX animals_idx ON visits (animals_id);


       /* to optiime query */

     CREATE INDEX vets_idx ON visits (vets_id);


       /* to optiime query */

     CREATE INDEX email_idx ON owners (email);