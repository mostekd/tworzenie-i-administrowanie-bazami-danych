CREATE DATABASE Mostowski;
 
CREATE USER Mostowski_Dawid WITH PASSWORD 'qwerty';
GRANT ALL PRIVILEGES ON DATABASE Mostowski TO 'Mostowski_Dawid';
 
SHOW GRANTS FOR 'Mostowski_Dawid';
 
CREATE USER 'jankowski12'@'localhost' WITH PASSWORD 'qwerty';
GRANT CREATE  ON Mostowski.Persons TO 'jankowski12';
GRANT DELETE ON Mostowski.Persons TO 'jankowski12';
GRANT DROP ON Mostowski.Persons TO 'jankowski12';
 
SHOW GRANTS FOR 'jankowski12';
 
SHOW GRANTS;
 
SHOW DATABASES;
 
DROP USER 'Mostowski_Dawid';