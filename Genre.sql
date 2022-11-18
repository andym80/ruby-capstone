-- Table: public.genre

-- DROP TABLE IF EXISTS public.genre;

CREATE TABLE IF NOT EXISTS public.genre
(
    id integer NOT NULL,
    name text COLLATE pg_catalog."default" NOT NULL,
    items text COLLATE pg_catalog."default" NOT NULL,
    add_items text COLLATE pg_catalog."default",
    CONSTRAINT genre_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.genre
    OWNER to postgres;