-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-14 11:28:05.162

-- tables
-- Table: ClientDim
CREATE TABLE ClientDim (
    ClientID int  NOT NULL,
    Name varchar(100)  NOT NULL,
    NIP nchar(10)  NOT NULL,
    Address varchar(255)  NOT NULL,
    CONSTRAINT ClientDim_pk PRIMARY KEY  (ClientID)
);

-- Table: DateDim
CREATE TABLE DateDim (
    DateID int  NOT NULL,
    Day int  NOT NULL,
    Month int  NOT NULL,
    Time time  NOT NULL,
    CONSTRAINT DateDim_pk PRIMARY KEY  (DateID)
);

-- Table: FactTable
CREATE TABLE FactTable (
    ID int  NOT NULL,
    FruitID int  NOT NULL,
    OrderID int  NOT NULL,
    ClientID int  NOT NULL,
    DateID int  NOT NULL,
    CONSTRAINT FactTable_pk PRIMARY KEY  (ID)
);

-- Table: FruitDim
CREATE TABLE FruitDim (
    FruitID int  NOT NULL,
    Category varchar(50)  NOT NULL,
    PriceKg money  NOT NULL,
    Name varchar(50)  NOT NULL,
    CONSTRAINT FruitDim_pk PRIMARY KEY  (FruitID)
);

-- Table: OrdersDim
CREATE TABLE OrdersDim (
    OrderID int  NOT NULL,
    Quantity int  NOT NULL,
    Place varchar(50)  NOT NULL,
    OrderAmount money  NOT NULL,
    CONSTRAINT OrdersDim_pk PRIMARY KEY  (OrderID)
);

-- foreign keys
-- Reference: FactTable_ClientDim (table: FactTable)
ALTER TABLE FactTable ADD CONSTRAINT FactTable_ClientDim
    FOREIGN KEY (ClientID)
    REFERENCES ClientDim (ClientID);

-- Reference: FactTable_DateDim (table: FactTable)
ALTER TABLE FactTable ADD CONSTRAINT FactTable_DateDim
    FOREIGN KEY (DateID)
    REFERENCES DateDim (DateID);

-- Reference: FactTable_FruitDim (table: FactTable)
ALTER TABLE FactTable ADD CONSTRAINT FactTable_FruitDim
    FOREIGN KEY (FruitID)
    REFERENCES FruitDim (FruitID);

-- Reference: FactTable_OrdersDim (table: FactTable)
ALTER TABLE FactTable ADD CONSTRAINT FactTable_OrdersDim
    FOREIGN KEY (OrderID)
    REFERENCES OrdersDim (OrderID);

-- sequences
-- Sequence: ClientDim_seq
CREATE SEQUENCE ClientDim_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: DateDim_seq
CREATE SEQUENCE DateDim_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: FactTable_seq
CREATE SEQUENCE FactTable_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: FruitDim_seq
CREATE SEQUENCE FruitDim_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: OrdersDim_seq
CREATE SEQUENCE OrdersDim_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- End of file.

