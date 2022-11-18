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
	
-- Table: public.Book

-- DROP TABLE IF EXISTS public."Book";

CREATE TABLE IF NOT EXISTS public."Book"
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    publisher text COLLATE pg_catalog."default",
    cover_state text COLLATE pg_catalog."default",
    CONSTRAINT "Book_pkey" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Book"
    OWNER to postgres;
	
-- Table: public.Games

-- DROP TABLE IF EXISTS public."Games";

CREATE TABLE IF NOT EXISTS public."Games"
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    multiplayer boolean,
    last_played_at date,
    CONSTRAINT "Games_pkey" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Games"
    OWNER to postgres;
	
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
	
-- Table: public.Label

-- DROP TABLE IF EXISTS public."Label";

CREATE TABLE IF NOT EXISTS public."Label"
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    title text COLLATE pg_catalog."default",
    color text COLLATE pg_catalog."default",
    CONSTRAINT "Label_pkey" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Label"
    OWNER to postgres;
	
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