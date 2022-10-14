-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-13 20:30:55.15

-- tables
-- Table: ClientDim
CREATE TABLE ClientDim (
    ClientID int  NOT NULL,
    PhoneNumber nvarchar(9)  NOT NULL,
    FirstName varchar(30)  NOT NULL,
    LastName varchar(30)  NOT NULL,
    CONSTRAINT ClientDim_pk PRIMARY KEY  (ClientID)
);

-- Table: DeliveryDim
CREATE TABLE DeliveryDim (
    DeliveryID int  NOT NULL,
    NIP nchar(10)  NOT NULL,
    Address varchar(255)  NOT NULL,
    Name varchar(100)  NOT NULL,
    CONSTRAINT DeliveryDim_pk PRIMARY KEY  (DeliveryID)
);

-- Table: FactTable
CREATE TABLE FactTable (
    ID int  NOT NULL,
    Date datetime  NOT NULL,
    DeliveryID int  NOT NULL,
    ProductID int  NOT NULL,
    ClientID int  NOT NULL,
    CONSTRAINT FactTable_pk PRIMARY KEY  (ID)
);

-- Table: ProductDim
CREATE TABLE ProductDim (
    ProductID int  NOT NULL,
    Publisher varchar(100)  NOT NULL,
    ISBN nvarchar(13)  NOT NULL,
    Title varchar(255)  NOT NULL,
    Author varchar(50)  NOT NULL,
    Position int  NOT NULL,
    PagesNumber int  NOT NULL,
    CONSTRAINT ProductDim_pk PRIMARY KEY  (ProductID)
);

-- foreign keys
-- Reference: DeliveryDim_FactTable (table: FactTable)
ALTER TABLE FactTable ADD CONSTRAINT DeliveryDim_FactTable
    FOREIGN KEY (DeliveryID)
    REFERENCES DeliveryDim (DeliveryID);

-- Reference: FactTable_ClientDim (table: FactTable)
ALTER TABLE FactTable ADD CONSTRAINT FactTable_ClientDim
    FOREIGN KEY (ClientID)
    REFERENCES ClientDim (ClientID);

-- Reference: FactTable_ProductDim (table: FactTable)
ALTER TABLE FactTable ADD CONSTRAINT FactTable_ProductDim
    FOREIGN KEY (ProductID)
    REFERENCES ProductDim (ProductID);

-- End of file.

