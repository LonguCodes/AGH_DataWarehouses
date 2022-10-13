-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-13 15:26:04.581

-- tables
-- Table: DimClient
CREATE TABLE DimClient (
    id int  NOT NULL,
    name Text  NOT NULL,
    nip Text  NOT NULL,
    adress Text  NOT NULL,
    CONSTRAINT DimClient_pk PRIMARY KEY (id)
);

-- Table: DimFruit
CREATE TABLE DimFruit (
    id int  NOT NULL,
    price_per_kg float  NOT NULL,
    category_id int  NOT NULL,
    CONSTRAINT DimFruit_pk PRIMARY KEY (id)
);

-- Table: DimFruitCategory
CREATE TABLE DimFruitCategory (
    id int  NOT NULL,
    name Text  NOT NULL,
    CONSTRAINT DimFruit_pk PRIMARY KEY (id)
);

-- Table: DimSalePlace
CREATE TABLE DimSalePlace (
    id int  NOT NULL,
    lattitude float  NOT NULL,
    longitude float  NOT NULL,
    CONSTRAINT DimSalePlace_pk PRIMARY KEY (id)
);

-- Table: DimSaleTime
CREATE TABLE DimSaleTime (
    id int  NOT NULL,
    day int  NOT NULL,
    month int  NOT NULL,
    hour int  NOT NULL,
    CONSTRAINT DimSaleTime_pk PRIMARY KEY (id)
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
    CONSTRAINT FactSale_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: DimFruit_DimFruitCategory (table: DimFruit)
ALTER TABLE DimFruit ADD CONSTRAINT DimFruit_DimFruitCategory
    FOREIGN KEY (category_id)
    REFERENCES DimFruitCategory (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FactSale_DimClient (table: FactSale)
ALTER TABLE FactSale ADD CONSTRAINT FactSale_DimClient
    FOREIGN KEY (client_id)
    REFERENCES DimClient (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FactSale_DimFruit (table: FactSale)
ALTER TABLE FactSale ADD CONSTRAINT FactSale_DimFruit
    FOREIGN KEY (fruid_id)
    REFERENCES DimFruit (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FactSale_DimSalePlace (table: FactSale)
ALTER TABLE FactSale ADD CONSTRAINT FactSale_DimSalePlace
    FOREIGN KEY (sale_place_id)
    REFERENCES DimSalePlace (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FactSale_DimSaleTime (table: FactSale)
ALTER TABLE FactSale ADD CONSTRAINT FactSale_DimSaleTime
    FOREIGN KEY (sale_time_id)
    REFERENCES DimSaleTime (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- sequences
-- Sequence: DimClient_seq
CREATE SEQUENCE DimClient_seq
      INCREMENT BY 1
      NO MINVALUE
      NO MAXVALUE
      START WITH 1
      NO CYCLE
;

-- Sequence: DimFruit_seq
CREATE SEQUENCE DimFruit_seq
      INCREMENT BY 1
      NO MINVALUE
      NO MAXVALUE
      START WITH 1
      NO CYCLE
;

-- Sequence: DimSalePlace_seq
CREATE SEQUENCE DimSalePlace_seq
      INCREMENT BY 1
      NO MINVALUE
      NO MAXVALUE
      START WITH 1
      NO CYCLE
;

-- Sequence: DimSaleTime_seq
CREATE SEQUENCE DimSaleTime_seq
      INCREMENT BY 1
      NO MINVALUE
      NO MAXVALUE
      START WITH 1
      NO CYCLE
;

-- Sequence: FactSale_seq
CREATE SEQUENCE FactSale_seq
      INCREMENT BY 1
      NO MINVALUE
      NO MAXVALUE
      START WITH 1
      NO CYCLE
;

-- End of file.

