--#1 
CREATE PROCEDURE AllGuests @className varchar(50)
AS
SELECT
Guests.name, Class.name, Class.levels from Class
JOIN Class l on c.levels = l.classId
JOIN Guests g on l.guestId = g.guestId
WHERE Classes.name = @className
END
EXEC AllGuests @className = "Mage"

--#2
GO
CREATE PROCEDURE TotalAmount @Guestid TINYINT
AS
	SELECT SUM(RoomStays.rate + Sales.Price), Guests.name FROM Guests
	JOIN Sales ON Sales.guestId = Guests.guestId
	JOIN RoomStays ON RoomStays.guestId = Guests.guestId
	WHERE Guests.guestId = @Guestid
	GROUP BY Guests.name;
GO

EXEC TotalAmount @Guestid = '1'; 

-- #4 
GO
CREATE PROCEDURE DeleteTavern
@name varchar(50)
AS 
DELETE FROM Taverns WHERE tavernId = @name
GO

-- #5
CREATE TRIGGER DeleteAll
ON Taverns
FOR DELETE 
AS 
BEGIN 
DELETE FROM Rooms
DELETE FROM Tavern_Services
DELETE FROM Supplies
END