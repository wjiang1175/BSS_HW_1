DROP DATABASE IF EXISTS TavernDB;
CREATE DATABASE TavernDB;
USE TavernDB;

CREATE TABLE tavern(
tavernId INT NOT NULL auto_increment,
tavern_name VARCHAR(50),
location VARCHAR(50),
primary key(tavernId)
);
CREATE TABLE Tavern_Services(
serviceId INT NOT NULL auto_increment,
service_name VARCHAR(50),
service_status VARCHAR(10),
tavernId INT,
primary key(serviceId)
);
CREATE TABLE sales(
salesId INT not null auto_increment,
service VARCHAR(50),
guest VARCHAR(50),
price DECIMAL(10,2) not null,
date_purchased DATE,
amount_purchased INT not null,
primary key (salesId)
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
CREATE TABLE supplySales(
supplyId INT,
salesId INT
);
CREATE TABLE guest(
guestId INT NOT NULL auto_increment,
guest_name VARCHAR(50),
notes VARCHAR(200),
birtday DATE,
cakedays DATE, 
guest_status VARCHAR(50),
primary key(guestId)
);
CREATE TABLE classes(
classId INT,
class_name VARCHAR(50),
primary key(classId)
);
CREATE TABLE guest_class(
classId INT,
guestId INT,
levels INT
);
CREATE TABLE users(
userId INT NOT NULL auto_increment,
user_name VARCHAR(50),
user_role VARCHAR(50),
tavernId INT,
primary key(userId)
);


ALTER TABLE Tavern_Services ADD FOREIGN KEY (tavernId) references tavern(tavernId);
ALTER TABLE guest_class ADD FOREIGN KEY (classId) references classes(classId);
ALTER TABLE guest_class ADD FOREIGN KEY (guestId) references guest(guestId);
ALTER TABLE supplySales ADD FOREIGN KEY (supplyId) references supply(supplyId);
ALTER TABLE supplySales ADD FOREIGN KEY (salesId) references sales(salesId);
ALTER TABLE users ADD FOREIGN KEY (tavernId) references tavern(tavernId);

INSERT INTO tavern (tavern_name, location)
VALUE ('Joy Fest', 'Florida'),
('Jack Lodge', 'Miami'),
('Yosawaka', 'California'),
('White Wolf', 'Poconos'),
('Gray Lodge', 'North Carolina');

INSERT INTO Tavern_Services(service_name, service_status)
VALUE ('pool', 'closed'),
('pool', 'open'),
('pool', 'open'),
('water park', 'open'),
('water park', 'closed'),
('water', 'open'),
('weapon sharpening', 'open'),
('weapon sharpening', 'closed'),
('arcade', 'open'),
('arcade', 'closed');


INSERT INTO sales (service, guest, price, date_purchased, amount_purchased)
VALUE ('pool', 'Ferd Jo', 10.95, '2019-08-19', 2),
('water park', 'Jake Co', 40.99, '2019-08-19', 6),
('weapon sharpening', 'Zack Zol', 14.00, '2019-03-02', 1),
('pool', 'Ken Lo', 11.95, '2019-06-24', 4),
('pool', 'Jacky Ro', 11.95, '2019-07-04', 3),
('arcade', 'Laura zu', 4.95, '2019-08-21', 2),
('water park', 'Zel Zo', 50.95, '2019-07-18', 5);

INSERT INTO supply (supply_name, unit, amount, cost, dates, tavern)
VALUE ('beef', 'pounds', 10, 200.00, '2019-06-18', 'White Wolf'),
('beef', 'pounds', 20, 450.96, '2019-08-19', 'Yosawaka'),
('chicken', 'pounds', 12, 50.00, '2019-05-09', 'White Wolf'),
('lettuce', 'pounds', 5, 30.00, '2019-08-12', 'Gray Lodge'),
('beef', 'pounds', 15, 240.37, '2019-06-28', 'Gray Lodge'),
('Coke', 'gallon', 20, 50.00, '2019-03-11', 'Joy Fest'),
('beef', 'pounds', 10, 205.00, '2019-06-12', 'Jack Lodge'),
('water', 'gallons', 50, 100.00, '2019-06-18', 'White Wolf');

INSERT INTO users (user_name, user_role)
VALUE ('Jorge Zael', 'Manager'),
('Kel Vo', 'Manager'),
('Adrian Tu', 'Manager'),
('Tim Sorl', 'Manager'),
('Andrew Coual', 'Manager');
