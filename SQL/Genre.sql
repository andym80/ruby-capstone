-- Table: public.genre

-- DROP TABLE IF EXISTS public.genre;

CREATE TABLE IF NOT EXISTS public.genre
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT genre_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.genre
    OWNER to postgres;