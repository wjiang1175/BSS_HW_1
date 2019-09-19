USE [WJiang_2019]

DROP TABLE IF EXISTS 
Rooms,
RoomStays;

CREATE TABLE Rooms (
roomId INT IDENTITY (1,1) PRIMARY KEY,
tavernId INT FOREIGN KEY REFERENCES tavern(tavernId),
roomNumber BIGINT,
roomStatus VARCHAR(50)
);

INSERT INTO Rooms (tavernId, roomNumber, roomStatus)
VALUES (1, 202, 'Vacant'),
(2, 303, 'Vacant'),
(3, 404, 'Vacant'),
(4, 505, 'Vacant'),
(5, 606, 'Vacant');

CREATE TABLE RoomStays(
Id INT IDENTITY (1,1) PRIMARY KEY,
roomId INT FOREIGN KEY REFERENCES Rooms(roomId),
guestId INT FOREIGN KEY REFERENCES guest(guestId),
stayed DATE,
rate DECIMAL (10,2)
);

INSERT INTO RoomStays (roomId, guestId, stayed, rate)
VALUES (1, 1, '09-07-2019', 299.99),
(1, 2, '09-12-2019', 285.99),
(2, 4, '09-19-2019', 269.99),
(3, 5, '09-23-2019', 249.99),
(4, 3, '09-28-2019', 289.99);

SELECT * FROM guest WHERE guest.birtday < '01-01-2000';
SELECT * FROM RoomStays WHERE rate > 100;
SELECT DISTINCT guest_name FROM guest;
SELECT guest_name FROM guest ORDER BY guest_name ASC;
SELECT TOP 10 * FROM sales ORDER BY price DESC;