/*
CREATE DATABASE IF NOT EXISTS "RubyCapstoneProject"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
*/


-- Table: public.Author

-- DROP TABLE IF EXISTS public."Author";

CREATE TABLE IF NOT EXISTS public."Author"
(
		id bigserial NOT NULL,
		"First_name" character varying(100) NOT NULL,
		"Last_name" character varying(100) NOT NULL,
		CONSTRAINT "Author_pkey" PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public."Author"
		OWNER to postgres;

-- Table: public.Label

-- DROP TABLE IF EXISTS public."Label";

CREATE TABLE IF NOT EXISTS public."Label"
(
		id bigserial NOT NULL,
		title character varying(100) NOT NULL,
		color character varying(100) NOT NULL,
		CONSTRAINT "Label_pkey" PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public."Label"
		OWNER to postgres;

-- Table: public.genre

-- DROP TABLE IF EXISTS public.genre;

CREATE TABLE IF NOT EXISTS public.genre
(
		id bigserial NOT NULL,
		name character varying(100) NOT NULL,
		CONSTRAINT genre_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.genre
		OWNER to postgres;

-- Table: public.Book

-- DROP TABLE IF EXISTS public."Book";

CREATE TABLE IF NOT EXISTS public."Book"
(
		id bigserial NOT NULL,
		Label bigint NOT NULL,
		genre bigint NOT NULL,
		author bigint NOT NULL,
		archived boolean NOT NULL DEFAULT FALSE,
		publish_date date NOT NULL,
		publisher character varying(100) NOT NULL,
		cover_state character varying(100) NOT NULL,
		CONSTRAINT "Book_pkey" PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public."Book"
		OWNER to postgres;

-- Table: public.Games

-- DROP TABLE IF EXISTS public."Games";

CREATE TABLE IF NOT EXISTS public."Games"
(
		id bigserial NOT NULL,
		Label bigint NOT NULL,
		genre bigint NOT NULL,
		author bigint NOT NULL,
		archived boolean NOT NULL DEFAULT FALSE,
		publish_date date NOT NULL,
		multiplayer boolean NOT NULL,
		last_played_at date NOT NULL,
		CONSTRAINT "Games_pkey" PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public."Games"
		OWNER to postgres;

-- Table: public.MusicAlbum

-- DROP TABLE IF EXISTS public."MusicAlbum";

CREATE TABLE IF NOT EXISTS public."MusicAlbum"
(
		id bigserial NOT NULL,
		Label bigint NOT NULL,
		genre bigint NOT NULL,
		author bigint NOT NULL,
		archived boolean NOT NULL DEFAULT FALSE,
		publish_date date NOT NULL,

		on_spotify boolean NOT NULL,
		CONSTRAINT "MusicAlbum_pkey" PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public."MusicAlbum"
		OWNER to postgres;





--- GAMEs FOREIGN KEY

ALTER TABLE IF EXISTS public."Games"
    ADD CONSTRAINT game_author_fk FOREIGN KEY (author)
    REFERENCES public."Author" (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS fki_game_author_fk
    ON public."Games"(author);

ALTER TABLE IF EXISTS public."Games"
    ADD CONSTRAINT game_label_fk FOREIGN KEY (label)
    REFERENCES public."Label" (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS fki_game_label_fk
    ON public."Games"(label);

ALTER TABLE IF EXISTS public."Games"
    ADD CONSTRAINT game_genre_fk FOREIGN KEY (genre)
    REFERENCES public.genre (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS fki_game_genre_fk
    ON public."Games"(genre);



--- BOOKs FOREIGN KEY

ALTER TABLE IF EXISTS public."Book"
    ADD CONSTRAINT book_author_fk FOREIGN KEY (author)
    REFERENCES public."Author" (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS fki_book_author_fk
    ON public."Book"(author);

ALTER TABLE IF EXISTS public."Book"
    ADD CONSTRAINT book_label_fk FOREIGN KEY (label)
    REFERENCES public."Label" (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS fki_book_label_fk
    ON public."Book"(label);

ALTER TABLE IF EXISTS public."Book"
    ADD CONSTRAINT book_genre_fk FOREIGN KEY (genre)
    REFERENCES public.genre (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS fki_book_genre_fk
    ON public."Book"(genre);

--- MUSICALBUMs FOREIGN KEY

ALTER TABLE IF EXISTS public."MusicAlbum"
    ADD CONSTRAINT music_album_author_fk FOREIGN KEY (author)
    REFERENCES public."Author" (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS fki_music_album_author_fk
    ON public."MusicAlbum"(author);

ALTER TABLE IF EXISTS public."MusicAlbum"
    ADD CONSTRAINT music_album_label_fk FOREIGN KEY (label)
    REFERENCES public."Label" (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS fki_music_album_label_fk
    ON public."MusicAlbum"(label);

ALTER TABLE IF EXISTS public."MusicAlbum"
    ADD CONSTRAINT music_album_genre_fk FOREIGN KEY (genre)
    REFERENCES public.genre (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS fki_music_album_genre_fk
    ON public."MusicAlbum"(genre);
