-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-14 12:12:50.831

-- tables
-- Table: FactTable
CREATE TABLE FactTable (
    "Key" int  NOT NULL,
    ProductKey int  NOT NULL,
    WarehouseID int  NOT NULL,
    CONSTRAINT FactTable_pk PRIMARY KEY  ("Key")
);

-- Table: ProductDim
CREATE TABLE ProductDim (
    ProductKey int  NOT NULL,
    ProductID int  NOT NULL,
    EffectiveStartDate date  NOT NULL,
    "Current" nvarchar(5)  NOT NULL,
    WarehouseStatus int  NOT NULL,
    Name varchar(100)  NOT NULL,
    Brand varchar(100)  NOT NULL,
    CONSTRAINT ProductDim_pk PRIMARY KEY  (ProductKey)
);

-- Table: WarehouseDim
CREATE TABLE WarehouseDim (
    WarehouseID int  NOT NULL,
    Country varchar(50)  NOT NULL,
    Address varchar(100)  NOT NULL,
    CONSTRAINT WarehouseDim_pk PRIMARY KEY  (WarehouseID)
);

-- foreign keys
-- Reference: FactTable_ProductDim (table: FactTable)
ALTER TABLE FactTable ADD CONSTRAINT FactTable_ProductDim
    FOREIGN KEY (ProductKey)
    REFERENCES ProductDim (ProductKey);

-- Reference: FactTable_WarehouseDim (table: FactTable)
ALTER TABLE FactTable ADD CONSTRAINT FactTable_WarehouseDim
    FOREIGN KEY (WarehouseID)
    REFERENCES WarehouseDim (WarehouseID);

-- End of file.

