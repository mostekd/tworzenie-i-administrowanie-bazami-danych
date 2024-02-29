CREATE DATABASE Mostowski;
CREATE TABLE Persons ( PersonID int, LastName varchar(255), FirstName varchar(255), Address varchar(255), City varchar(255));
 
CREATE USER 'Mostowski_Dawid'@'localhost' IDENTIFIED BY 'qwerty';
GRANT ALL PRIVILEGES ON Mostowski TO 'Mostowski_Dawid'@'localhost';
FLUSH PRIVILEGES;
 
SHOW GRANTS FOR 'Mostowski_Dawid'@'localhost';
 
CREATE USER 'jankowski12'@'localhost' IDENTIFIED BY 'qwerty';
GRANT CREATE  ON Mostowski.Persons TO 'jankowski12'@'localhost';
GRANT DELETE ON Mostowski.Persons TO 'jankowski12'@'localhost';
GRANT DROP ON Mostowski.Persons TO 'jankowski12'@'localhost';
 
FLUSH PRIVILEGES;
 
SHOW GRANTS FOR 'jankowski12'@'localhost';
 
SHOW GRANTS;
 
SHOW DATABASES;
 
DROP USER 'Mostowski_Dawid'@'localhost';
 
X - Nazwisko
Y - IMIE
C - NUMER Z DZIENNIKA