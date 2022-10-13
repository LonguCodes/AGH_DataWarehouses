-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-13 15:40:43.237

-- tables
-- Table: DimDate
CREATE TABLE DimDate (
    id int  NOT NULL,
    date Date  NOT NULL,
    day int  NOT NULL,
    month int  NOT NULL,
    year int  NOT NULL,
    week_day int  NOT NULL,
    year_day int  NOT NULL,
    year_week int  NOT NULL,
    CONSTRAINT DimDate_pk PRIMARY KEY  (id)
);

-- Table: DimProduct
CREATE TABLE DimProduct (
    id int  NOT NULL,
    name text  NOT NULL,
    brand text  NOT NULL,
    replaced_by_id int  NOT NULL,
    CONSTRAINT DimProduct_pk PRIMARY KEY  (id)
);

-- Table: DimWarehouse
CREATE TABLE DimWarehouse (
    id int  NOT NULL,
    adress text  NOT NULL,
    country text  NOT NULL,
    CONSTRAINT DimWarehouse_pk PRIMARY KEY  (id)
);

-- Table: FactWarehouseState
CREATE TABLE FactWarehouseState (
    id int  NOT NULL,
    amount int  NOT NULL,
    product_id int  NOT NULL,
    warehouse_id int  NOT NULL,
    effective_date_id int  NOT NULL,
    CONSTRAINT FactWarehouseState_pk PRIMARY KEY  (id)
);

-- foreign keys
-- Reference: DimProduct_DimProduct (table: DimProduct)
ALTER TABLE DimProduct ADD CONSTRAINT DimProduct_DimProduct
    FOREIGN KEY (replaced_by_id)
    REFERENCES DimProduct (id);

-- Reference: FactWarehouseState_DimDate (table: FactWarehouseState)
ALTER TABLE FactWarehouseState ADD CONSTRAINT FactWarehouseState_DimDate
    FOREIGN KEY (effective_date_id)
    REFERENCES DimDate (id);

-- Reference: FactWarehouseState_DimProduct (table: FactWarehouseState)
ALTER TABLE FactWarehouseState ADD CONSTRAINT FactWarehouseState_DimProduct
    FOREIGN KEY (product_id)
    REFERENCES DimProduct (id);

-- Reference: FactWarehouseState_DimWarehouse (table: FactWarehouseState)
ALTER TABLE FactWarehouseState ADD CONSTRAINT FactWarehouseState_DimWarehouse
    FOREIGN KEY (warehouse_id)
    REFERENCES DimWarehouse (id);

-- End of file.

