drop database if exists sklep;
create database sklep;
use sklep;

create table Users (
    UserID int auto_increment primary key,
    Name varchar(255),
    Email varchar(255)
);

create table Orders (
    OrderID int auto_increment primary key,
    UserID int,
    OrderDate date
);

create table OrderItems (
    ItemID int auto_increment primary key,
    OrderID int,
    ProductName varchar(255),
    Quantity int,
    Price decimal(10, 2)
);

INSERT INTO `Users`(`UserID`, `Name`, `Email`) VALUES ('1','Jan Kowalski','jan@example.com');
INSERT INTO `Users`(`UserID`, `Name`, `Email`) VALUES ('2','Anna Nowak','anna@example.com');
INSERT INTO `Users`(`UserID`, `Name`, `Email`) VALUES ('3','Piotr Zieliński','piotr@example.com');

INSERT INTO `Orders`(`OrderID`, `UserID`, `OrderDate`) VALUES ('101','1','2023-12-01');
INSERT INTO `Orders`(`OrderID`, `UserID`, `OrderDate`) VALUES ('102','2','2023-12-02');
INSERT INTO `Orders`(`OrderID`, `UserID`, `OrderDate`) VALUES ('103','1','2023-12-03');

INSERT INTO `OrderItems`(`ItemID`, `OrderID`, `ProductName`, `Quantity`, `Price`) VALUES ('1001','101','Laptop','1','3500');
INSERT INTO `OrderItems`(`ItemID`, `OrderID`, `ProductName`, `Quantity`, `Price`) VALUES ('1002','101','Myszka','2','50');
INSERT INTO `OrderItems`(`ItemID`, `OrderID`, `ProductName`, `Quantity`, `Price`) VALUES ('1003','102','Monitor','1','800');
INSERT INTO `OrderItems`(`ItemID`, `OrderID`, `ProductName`, `Quantity`, `Price`) VALUES ('1004','103','Klawiatura','1','200');