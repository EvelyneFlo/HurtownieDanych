-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-14 11:55:46.547

-- tables
-- Table: FactTable
CREATE TABLE FactTable (
    WorkerID int  NOT NULL,
    PESEL nchar(11)  NOT NULL,
    Address varchar(100)  NOT NULL,
    Salary money  NOT NULL,
    Grade int  NOT NULL,
    CONSTRAINT FactTable_pk PRIMARY KEY  (WorkerID)
);

-- Table: HistoricDim
CREATE TABLE HistoricDim (
    ID int  NOT NULL,
    WorkerID int  NOT NULL,
    Grade int  NOT NULL,
    Grade_date date  NOT NULL,
    Grade_year int  NOT NULL,
    Grade_month int  NOT NULL,
    Grade_day int  NOT NULL,
    CONSTRAINT HistoricDim_pk PRIMARY KEY  (ID)
);

-- foreign keys
-- Reference: HistoricDim_FactTable (table: HistoricDim)
ALTER TABLE HistoricDim ADD CONSTRAINT HistoricDim_FactTable
    FOREIGN KEY (WorkerID)
    REFERENCES FactTable (WorkerID);

-- End of file.

