-- Table: public.Author

-- DROP TABLE IF EXISTS public."Author";

CREATE TABLE IF NOT EXISTS public."Author"
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "First_name" text COLLATE pg_catalog."default",
    "Last_name" text COLLATE pg_catalog."default",
    CONSTRAINT "Author_pkey" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Author"
    OWNER to postgres;