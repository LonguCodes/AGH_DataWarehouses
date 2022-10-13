-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-13 15:08:48.144

-- tables
-- Table: DimClient
CREATE TABLE DimClient (
    id int  NOT NULL,
    phone_number text  NOT NULL,
    adress text  NOT NULL,
    name text  NOT NULL,
    last_name text  NOT NULL,
    CONSTRAINT DimClient_pk PRIMARY KEY  (id)
);

-- Table: DimDate
CREATE TABLE DimDate (
    id int  NOT NULL,
    month_name text  NOT NULL,
    year text  NOT NULL,
    month_day int  NOT NULL,
    week_day int  NOT NULL,
    year_week int  NOT NULL,
    CONSTRAINT DimDate_pk PRIMARY KEY  (id)
);

-- Table: DimProduct
CREATE TABLE DimProduct (
    id int  NOT NULL,
    ISNB text  NOT NULL,
    title text  NOT NULL,
    author text  NOT NULL,
    page_count int  NOT NULL,
    publisher_id int  NOT NULL,
    CONSTRAINT DimProduct_pk PRIMARY KEY  (id)
);

-- Table: DimPublisher
CREATE TABLE DimPublisher (
    id int  NOT NULL,
    name text  NOT NULL,
    address text  NOT NULL,
    CONSTRAINT DimPublisher_pk PRIMARY KEY  (id)
);

-- Table: DimShipper
CREATE TABLE DimShipper (
    id int  NOT NULL,
    NIP text  NOT NULL,
    adress text  NOT NULL,
    name text  NOT NULL,
    CONSTRAINT DimShipper_pk PRIMARY KEY  (id)
);

-- Table: FactSales
CREATE TABLE FactSales (
    Id int  NOT NULL,
    date_id int  NOT NULL,
    client_id int  NOT NULL,
    shipper_id int  NOT NULL,
    product_id int  NOT NULL,
    Copy_of_DimClient_id int  NOT NULL,
    CONSTRAINT FactSales_pk PRIMARY KEY  (Id)
);

-- foreign keys
-- Reference: DimProduct_DimPublisher (table: DimProduct)
ALTER TABLE DimProduct ADD CONSTRAINT DimProduct_DimPublisher
    FOREIGN KEY (publisher_id)
    REFERENCES DimPublisher (id);

-- Reference: FactSales_Copy_of_DimClient (table: FactSales)
ALTER TABLE FactSales ADD CONSTRAINT FactSales_Copy_of_DimClient
    FOREIGN KEY (date_id)
    REFERENCES DimDate (id);

-- Reference: FactSales_DimClient (table: FactSales)
ALTER TABLE FactSales ADD CONSTRAINT FactSales_DimClient
    FOREIGN KEY (client_id)
    REFERENCES DimClient (id);

-- Reference: FactSales_DimProduct (table: FactSales)
ALTER TABLE FactSales ADD CONSTRAINT FactSales_DimProduct
    FOREIGN KEY (product_id)
    REFERENCES DimProduct (id);

-- Reference: FactSales_DimShipper (table: FactSales)
ALTER TABLE FactSales ADD CONSTRAINT FactSales_DimShipper
    FOREIGN KEY (shipper_id)
    REFERENCES DimShipper (id);

-- End of file.

