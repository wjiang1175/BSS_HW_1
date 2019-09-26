USE WJiang_2019
DROP TABLE IF EXISTS
Room_Stays,
Room_Status,
Rooms,
Class,
Classes,
Guest_Status,
Guests,
Service_Status,
TServices,
Supply_Sales,
Tavern_Stock,
Supplies,
Sales,
Roles,
Users,
Tavern_Location,
Taverns;



Create table Taverns (
	tavernId INT primary key identity (1,1),
	name varchar(200),
	info varchar(max),
	locationId INT, --FK location.locationId
	userId INT --FK users.userId
);

create table Tavern_Location (
	locationId INT primary key,
	name Varchar(200)
);


Create table Users (
	userId INT primary key identity (1,1),
	name Varchar(200),
	roleId INT--FK roles.rolesId
);

create table Roles (
	roleId INT primary key,
	name Varchar(200),
	descriptions Varchar(max)
);

create table Sales (
	saleId INT primary key identity (1,1),
	supplyId INT, -- FK supplies.supplyId
	tavernId INT, -- FK taverns.tavernId
	guestId INT, -- FK guest.guestID
	price decimal(10,2),
	amount decimal (10,2),
);

create table Supplies (
	supplyId INT primary Key identity (1,1),
	name Varchar(50),
	type Varchar(50),
	unit varchar(50)
);

create table Tavern_Stock(
	stockId INT primary key,
	tavernId INT, -- FK tavern.tavernId
	supplyID INT, -- supplies.supplyID
	units INT
);

create table Supply_Sales(
	SupSalesId INT,
	supplyId INT, -- FK supplies.supplyId
	tavernId INT, -- FK taver.tavernId
	cost decimal(10,2),
	amount decimal (10,2),
	dates DATE
);

create table TServices(
	serviceId INT primary key,
	name  varchar(50),
	type varchar(50),
	statusId INT --FK serviceStatus.statusId
);

create table Service_Status(
	statusId INT primary key,
	status varchar(50)
);

create table Guests(
	guestId INT primary key identity (1,1),
	name varchar(100),
	notes varchar(max),
	birthday Date,
	statusId INT --FK guestStatus.statusId
);

create table Guest_Status(
	statusId int primary key,
	status varchar(50)
);

create table Classes(
	classId int primary key,
	name varchar(50)
);

create table Class(
	guestId INT,  --FK guests.guestId
	classId INT, 
	levels INT, 
);

create table Rooms(
	roomId INT primary key identity(1,1),
	name varchar(100),
	roomNum tinyint,
	price decimal(10,2),
	RoomStatusId INT, --FK room_status.statusID
	tavernId INT,--FK tavern.tavernID
);

create table Room_Status(
	RoomStatusId INT primary key,
	status varchar(50),
);

create table Room_Stays(
	stayId INT primary key identity(1,1),
	roomId INT, -- FK rooms.roomId
	guestId INT, --FK guest.guestId
	stayed DATE, 
);

ALTER TABLE Users add foreign key (roleId) references Roles(roleId);
ALTER TABLE Taverns add foreign key (locationId) references Tavern_Location(locationId);
ALTER TABLE Taverns add foreign key (userId) references Users(userId);
ALTER TABLE Sales add foreign key (supplyId) references Supplies(supplyId);
ALTER TABLE sales add foreign key (tavernId) references Taverns(tavernId);
ALTER TABLE sales add foreign key (guestId) references Guests(guestId);
ALTER TABLE Tavern_Stock add foreign key (tavernId) references Taverns(tavernId);
ALTER TABLE Tavern_Stock add foreign key (supplyId) references Supplies(supplyId);
ALTER TABLE Supply_Sales add foreign key (supplyId) references Supplies(supplyId);
ALTER TABLE Supply_Sales add foreign key (tavernId) references Taverns(tavernId);
ALTER TABLE TServices add foreign key (statusId) references Service_Status(statusId);
ALTER TABLE Guests add foreign key (statusId) references Guest_Status(statusId);
ALTER TABLE Class add foreign key (guestId) references Guests(guestId);
ALTER TABLE Rooms add foreign key (RoomStatusId) references Room_Status(RoomStatusId);
ALTER TABLE Rooms add foreign key (tavernId) references Taverns(tavernId);
ALTER TABLE Room_Stays add foreign key (roomId) references Rooms(roomId);
ALTER TABLE Room_Stays add foreign key (guestId) references Guests(guestId);


INSERT INTO Roles(roleId, name, descriptions)
VALUES
(1, 'Manager', 'Manages the Tavern'),
(2, 'Bar Tender', 'Make drinks'),
(3, 'Cleaner', 'Cleans the Tavern'),
(4, 'Admin', 'Big Boss'),
(5, 'Guard', 'Keeps the Tavern in peace');

INSERT INTO Users(name, roleId)
VALUES
('Jake Ren', 1),
('Ken Len', 1),
('Pual Ro', 2),
('Adrian Yen', 3),
('JoJo Ro', 4),
('Mat Pen', 4),
('Pen Xera', 5);

INSERT INTO Tavern_Location(locationId, name)
VALUES
(1, 'Florida'),
(2, 'Miami'),
(3, 'Poconos'),
(4, 'North Carolina'),
(5, 'California');

INSERT INTO Taverns(name, info, locationId, userId)
VALUES
('Joy Fest', 'High level Tavern', 1, 1),
('Jack Lodge', 'Party Tavern',2,3),
('Yosawaka', 'Best place to rest for the night',4,5),
('White Wolf', 'Social gathering',5,6),
('Gray Lodge', 'Hunting time',3,7);

INSERT INTO Supplies(name, type, unit)
VALUES
('beef','meat', 'Ounce'),
('chicken','meat', 'Ounce'),
('lettuce','Veggie', 'Ounce'),
('Coke','drink', 'Oz'),
('water','drink', 'Oz');

INSERT INTO Sales(supplyId, tavernId, guestId, price, amount)
VALUES
(1,1,1,40.50,12),
(1,2,2,50.99,16),
(2,3,1,20.55,14),
(2,5,1,20.00,14),
(3,2,1,15.80,5),
(3,4,1,18.50,5),
(4,5,1,12.25,16),
(5,3,1,10.80,16),
(5,1,1,5.55,16);

INSERT INTO Supply_Sales(supplyId, tavernId, cost, amount, dates)
VALUES
(1,1,90,2,'09/12/2019'),
(1,2,102.98,2,'07/18/2019'),
(2,3,20.55,1,'06/22/2019'),
(3,4,37,2,'03/26/2019'),
(4,5,49,4,'11/11/2019'),
(5,1,27.75,5,'01/05/2019');

INSERT INTO Guest_Status(statusId, status)
VALUES
(1, 'Healthy'),
(2, 'Drunk'),
(3, 'Dead'),
(4, 'Weak'),
(5, 'Fainted');

INSERT INTO Guests (name, notes, birthday, statusId)
VALUES
('Gray', 'One you want to avoid', '06/23/1994', 1),
('Zel', 'The charming one', '02/12/1993', 2),
('Fel', 'The weakest', '04/22/1991', 4),
('Owl', 'The Weird Guy', '11/17/1993', 5),
('Maso', 'He chill', '12/21/1991', 3);

INSERT INTO Classes (classId, name)
VALUES
(1, 'Mage'),
(2, 'Warrior'),
(3, 'Rogue'),
(4, 'Archer'),
(5, 'Warlock'),
(6, 'Monk'),
(7, 'Healer');

INSERT INTO Class(guestId, classId, levels)
VALUES
(1,1,2),
(1,3,9),
(2,4,12),
(3,6,4),
(3,3,5),
(4,2,8),
(5,4,9),
(5,1,3);

INSERT INTO Tavern_Stock(stockId, tavernId, supplyID, units)
VALUES
(1,1,1,10),
(2,2,1,20),
(3,3,2,12),
(4,4,2,20),
(5,2,3,15),
(6,2,4,20),
(7,5,5,30),
(8,3,5,25);

INSERT INTO Service_Status(statusId, status)
VALUES
(1,'Active'),
(2,'Inactive'),
(3,'Under Repair'),
(4,'Discontinued'),
(5,'Closed');

INSERT INTO TServices(serviceId,name,type,statusId)
VALUES
(1, 'Pool', 'Activity', 1),
(2, 'Weapon Sharpening', 'Workshop', 1),
(3, 'Water Park', 'Activity', 5),
(4, 'Concert', 'Music', 2),
(5, 'Room Cleaning', 'Cleaner', 1);

INSERT INTO Room_Status(RoomStatusId, status)
VALUES
(1,'Vacant'),
(2,'Occupied'),
(3,'Cleaning'),
(4,'Under Maintance');

INSERT INTO Rooms (name, roomNum, RoomStatusId, tavernId, price)
VALUES
('Common Room', 101, 1, 1, 100),
('Master Room', 202, 2, 2, 110),
('Dark Room', 303, 2, 3, 111),
('VIP Suite', 404, 3, 4, 120),
('Twin Room', 505, 1, 5, 90);

INSERT INTO Room_Stays(roomId, guestId, stayed)
VALUES
(1, 2, '09/12/2019'),
(2, 1, '07/18/2019'),
(3, 3, '06/22/2019'),
(4, 5, '03/26/2019'),
(5, 4, '11/11/2019');
