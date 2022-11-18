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