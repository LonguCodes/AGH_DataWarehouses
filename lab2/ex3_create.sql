-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-13 15:22:36.215

-- tables
-- Table: DimClient
CREATE TABLE DimClient (
    id int  NOT NULL,
    name Text  NOT NULL,
    nip Text  NOT NULL,
    adress Text  NOT NULL,
    CONSTRAINT DimClient_pk PRIMARY KEY  (id)
);

-- Table: DimFruit
CREATE TABLE DimFruit (
    id int  NOT NULL,
    category Text  NOT NULL,
    price_per_kg float  NOT NULL,
    CONSTRAINT DimFruit_pk PRIMARY KEY  (id)
);

-- Table: DimSalePlace
CREATE TABLE DimSalePlace (
    id int  NOT NULL,
    lattitude float  NOT NULL,
    longitude float  NOT NULL,
    CONSTRAINT DimSalePlace_pk PRIMARY KEY  (id)
);

-- Table: DimSaleTime
CREATE TABLE DimSaleTime (
    id int  NOT NULL,
    day int  NOT NULL,
    month int  NOT NULL,
    hour int  NOT NULL,
    CONSTRAINT DimSaleTime_pk PRIMARY KEY  (id)
);

-- Table: FactSale
CREATE TABLE FactSale (
    id int  NOT NULL,
    amount int  NOT NULL,
    price int  NOT NULL,
    fruid_id int  NOT NULL,
    sale_place_id int  NOT NULL,
    sale_time_id int  NOT NULL,
    client_id int  NOT NULL,
    CONSTRAINT FactSale_pk PRIMARY KEY  (id)
);

-- foreign keys
-- Reference: FactSale_DimClient (table: FactSale)
ALTER TABLE FactSale ADD CONSTRAINT FactSale_DimClient
    FOREIGN KEY (client_id)
    REFERENCES DimClient (id);

-- Reference: FactSale_DimFruit (table: FactSale)
ALTER TABLE FactSale ADD CONSTRAINT FactSale_DimFruit
    FOREIGN KEY (fruid_id)
    REFERENCES DimFruit (id);

-- Reference: FactSale_DimSalePlace (table: FactSale)
ALTER TABLE FactSale ADD CONSTRAINT FactSale_DimSalePlace
    FOREIGN KEY (sale_place_id)
    REFERENCES DimSalePlace (id);

-- Reference: FactSale_DimSaleTime (table: FactSale)
ALTER TABLE FactSale ADD CONSTRAINT FactSale_DimSaleTime
    FOREIGN KEY (sale_time_id)
    REFERENCES DimSaleTime (id);

-- sequences
-- Sequence: DimClient_seq
CREATE SEQUENCE DimClient_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: DimFruit_seq
CREATE SEQUENCE DimFruit_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: DimSalePlace_seq
CREATE SEQUENCE DimSalePlace_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: DimSaleTime_seq
CREATE SEQUENCE DimSaleTime_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: FactSale_seq
CREATE SEQUENCE FactSale_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- End of file.

