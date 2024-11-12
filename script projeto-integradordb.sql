
-- SCHEMA: servicos

-- DROP SCHEMA IF EXISTS servicos ;

CREATE SCHEMA IF NOT EXISTS servicos
    AUTHORIZATION postgres;

    -- DROP TABLE IF EXISTS servicos.clientes;

CREATE TABLE IF NOT EXISTS servicos.clientes
(
    "CPF" text COLLATE pg_catalog."default" NOT NULL,
    nome text COLLATE pg_catalog."default" NOT NULL,
    nascimento date NOT NULL,
    numero integer NOT NULL,
    cidade text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT clientes_pkey PRIMARY KEY ("CPF")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS servicos.clientes
    OWNER to postgres;

    

    -- DROP TABLE IF EXISTS servicos.veiculos;

CREATE TABLE IF NOT EXISTS servicos.veiculos
(
    "cpf-dono" text COLLATE pg_catalog."default" NOT NULL,
    "placa-veiculo" text COLLATE pg_catalog."default" NOT NULL,
    ano text COLLATE pg_catalog."default" NOT NULL,
    "nome-veiculo" text COLLATE pg_catalog."default" NOT NULL,
    "km-rodados" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT veiculos_pkey PRIMARY KEY ("cpf-dono", "placa-veiculo"),
    CONSTRAINT "dono-cpf" FOREIGN KEY ("cpf-dono")
        REFERENCES servicos.clientes ("CPF") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS servicos.veiculos
    OWNER to postgres;
-- Index: fki_c

-- DROP INDEX IF EXISTS servicos.fki_c;

CREATE INDEX IF NOT EXISTS fki_c
    ON servicos.veiculos USING btree
    ("cpf-dono" COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;