-- Table: public.MusicAlbum

-- DROP TABLE IF EXISTS public."MusicAlbum";

CREATE TABLE IF NOT EXISTS public."MusicAlbum"
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "Label" text COLLATE pg_catalog."default" NOT NULL,
    genre text COLLATE pg_catalog."default" NOT NULL,
    author text COLLATE pg_catalog."default" NOT NULL,
    source text COLLATE pg_catalog."default",
    archived boolean,
    publish_date date,
    on_spotify boolean,
    CONSTRAINT "MusicAlbum_pkey" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."MusicAlbum"
    OWNER to postgres;