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