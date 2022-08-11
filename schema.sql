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