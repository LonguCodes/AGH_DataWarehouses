-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-13 15:36:09.102

-- tables
-- Table: DimEmployeeRating
CREATE TABLE DimEmployeeRating (
    id int  NOT NULL,
    employee_id int  NOT NULL,
    rating int  NOT NULL,
    issue_date date  NOT NULL,
    CONSTRAINT DimEmployeeRating_pk PRIMARY KEY  (id)
);

-- Table: FactEmployee
CREATE TABLE FactEmployee (
    id int  NOT NULL,
    pesel text  NOT NULL,
    adress text  NOT NULL,
    salary decimal(10,2)  NOT NULL,
    CONSTRAINT FactEmployee_pk PRIMARY KEY  (id)
);

-- foreign keys
-- Reference: DimEmployeeRating_FactEmployee (table: DimEmployeeRating)
ALTER TABLE DimEmployeeRating ADD CONSTRAINT DimEmployeeRating_FactEmployee
    FOREIGN KEY (employee_id)
    REFERENCES FactEmployee (id);

-- End of file.

