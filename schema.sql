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