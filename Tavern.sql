DROP DATABASE IF EXISTS TavernDB;
CREATE DATABASE TavernDB;
USE TavernDB;

CREATE TABLE tavern(
taverId INT NOT NULL auto_increment,
tavern_name VARCHAR(50),
location VARCHAR(50),
primary key(taverId)
);
CREATE TABLE Tavern_Services(
service_name VARCHAR(50),
service_status VARCHAR(10),
tavern_name VARCHAR(50)
);
CREATE TABLE sales(
service VARCHAR(50),
guest VARCHAR(50),
price DECIMAL(10,2) not null,
date_purchased DATE,
amount_purchased INT,
tavern VARCHAR(50)
);
CREATE TABLE supply(
supplyId INT NOT NULL auto_increment,
supply_name VARCHAR(50),
unit VARCHAR(20),
amount INT default 0,
cost DECIMAL(10,2) not null,
dates DATE,
tavern VARCHAR(50),
primary key(supplyId)
);
CREATE TABLE users(
userId INT NOT NULL auto_increment,
user_name VARCHAR(50),
user_role VARCHAR(50),
primary key(userId)
);
CREATE TABLE rats(
ratId INT NOT NULL auto_increment,
rat_name VARCHAR(20),
rat_floor INT not null,
primary key(ratId)
);

INSERT INTO tavern (tavern_name, location)
VALUE ('Joy Fest', 'Florida'),
('Jack Lodge', 'Miami'),
('Yosawaka', 'California'),
('White Wolf', 'Poconos'),
('Gray Lodge', 'North Carolina');

INSERT INTO Tavern_Services(service_name, service_status, tavern_name)
VALUE ('pool', 'closed', 'Yosawaka'),
('pool', 'open', 'White Wolf'),
('pool', 'open', 'Joy Fest'),
('water park', 'open', 'Jack Lodge'),
('water park', 'closed', 'Yosawaka'),
('water', 'open', 'Joy Fest'),
('weapon sharpening', 'open', 'Yosawaka'),
('weapon sharpening', 'closed', 'Joy Fest'),
('arcade', 'open', 'Joyfest'),
('arcade', 'closed', 'Gray Lodge');


INSERT INTO sales (service, guest, price, date_purchased, amount_purchased, tavern)
VALUE ('pool', 'Ferd Jo', 10.95, 2019-06-13, 2, 'White Wolf'),
('water park', 'Jake Co', 40.99, 2019-08-19, 6, 'Jack Lodge'),
('weapon sharpening', 'Zack Zol', 14.00, 2019-03-02, 1, 'Yosawaka'),
('pool', 'Ken Lo', 11.95, 2019-06-24, 4, 'Joy Fest'),
('pool', 'Jacky Ro', 11.95, 2019-07-04, 3, 'White Wolf'),
('arcade', 'Laura zu', 4.95, 2019-08-21, 2, 'Gray Lodge'),
('water park', 'Zel Zo', 50.95, 2019-07-18, 5, 'Joy Fest');

INSERT INTO supply (supply_name, unit, amount, cost, dates)
VALUE ('beef', 'pounds', 10, 200.00, 2019-06-18, 'White Wolf'),
('beef', 'pounds', 20, 450.96, 2019-08-19, 'Yosawaka'),
('chicken', 'pounds', 12, 50.00, 2019-05-09, 'White Wolf'),
('lettuce', 'pounds', 5, 30.00, 2019-08-12, 'Gray Lodge'),
('beef', 'pounds', 15, 240.37, 2019-06-28, 'Gray Lodge'),
('Coke', 'gallon', 20, 50.00, 2019-03-11, 'Joy Fest'),
('beef', 'pounds', 10, 205.00, 2019-06-12, 'Jack Lodge'),
('water', 'gallons', 50, 100.00, 2019-06-18, 'White Wolf');

INSERT INTO users (user_name, user_role)
VALUE ('Jorge Zael', 'Manager'),
('Kel Vo', 'Manager'),
('Adrian Tu', 'Manager'),
('Tim Sorl', 'Manager'),
('Andrew Coual', 'Manager');

INSERT INTO rats (rat_name, rat_floor)
VALUE ('jake', 1),
('Ko', 3),
('Pinapple', 2),
('zack', 1),
('mango', 3);