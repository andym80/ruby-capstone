-- Table: public.Items

-- DROP TABLE IF EXISTS public."Items";

CREATE TABLE IF NOT EXISTS public."Items"
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    genre text COLLATE pg_catalog."default",
    author text COLLATE pg_catalog."default",
    source text COLLATE pg_catalog."default",
    label text COLLATE pg_catalog."default",
    publish_date date,
    CONSTRAINT "Items_pkey" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Items"
    OWNER to postgres;