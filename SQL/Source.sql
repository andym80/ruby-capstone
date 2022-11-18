-- Table: public.Source

-- DROP TABLE IF EXISTS public."Source";

CREATE TABLE IF NOT EXISTS public."Source"
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name text COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Source"
    OWNER to postgres;