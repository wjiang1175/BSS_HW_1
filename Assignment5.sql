--#1 
SELECT u.name as 'Users', r.name as 'Role' from Users u join Roles r on u.userId = r.roleId

--#2
SELECT COUNT(Guests.name) as 'Guests', Classes.name as 'Classes' 
FROM (
	SELECT c.name, g.guestId from Classes c
	JOIN Class cc on c.classId = cc.classId
	JOIN Guests g on cc.guestId = g.gusetId
	)
Group by class.Name