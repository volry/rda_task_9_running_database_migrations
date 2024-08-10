--liquibase formatted sql

--changeset mate.academy:1 labels:0.0.1
CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);
--rollback DROP TABLE Countries;

--changeset mate.academy:2 labels:0.0.1
CREATE TABLE Products (
    ID INT AUTO_INCREMENT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);
--rollback DROP TABLE Products;

--changeset mate.academy:3 labels:0.0.1
CREATE TABLE Warehouses (
    ID INT AUTO_INCREMENT,
    Name VARCHAR(50),
    Address VARCHAR(50),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);
--rollback DROP TABLE Warehouses;

--changeset mate.academy:4 labels:0.0.1
CREATE TABLE ProductInventory (
    ID INT,
    ProductID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE NO ACTION,
    WarehouseAmount INT,
    WarehouseID INT,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);
--rollback DROP TABLE ProductInventory;

--changeset mate.academy:5 labels:0.0.2
CREATE TABLE Users (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Email VARCHAR(255)
);
--rollback DROP TABLE Users;

--changeset mate.academy:6 labels:0.0.3
CREATE INDEX idx_email ON Users(Email);
--rollback DROP INDEX idx_email ON Users;
