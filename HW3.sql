/* Elina Azrilyan
Homework # 3
Project: Building a Relational Database Management System
*/
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Groups;
DROP TABLE IF EXISTS Rooms;

CREATE TABLE Users
(
  user_id int PRIMARY KEY,
  user_name varchar(30) NOT NULL,
  user_group varchar(30) 
);

INSERT INTO Users ( user_id, user_name, user_group ) VALUES ( 1,'Modesto', 'IT');
INSERT INTO Users ( user_id, user_name, user_group ) VALUES ( 2, 'Ayine', 'IT');
INSERT INTO Users ( user_id, user_name, user_group ) VALUES ( 3, 'Christopher', 'Sales');
INSERT INTO Users ( user_id, user_name, user_group ) VALUES ( 4, 'Cheong woo', 'Sales');
INSERT INTO Users ( user_id, user_name, user_group ) VALUES ( 5, 'Saulat', 'Administration');
INSERT INTO Users ( user_id, user_name, user_group ) VALUES ( 6, 'Heidy', null);


SELECT * FROM Users;

CREATE TABLE Rooms
(
  room_id int PRIMARY KEY,
  room_name varchar(30) NOT NULL,
  access_group varchar(30) 
);

INSERT INTO Rooms ( room_id, room_name) VALUES ( 1,'101');
INSERT INTO Rooms ( room_id, room_name) VALUES ( 2,'102');
INSERT INTO Rooms ( room_id, room_name) VALUES ( 3,'Auditorium A');
INSERT INTO Rooms ( room_id, room_name) VALUES ( 4,'Auditorium B');


SELECT * FROM Rooms;

CREATE TABLE Groups
(
  group_id int PRIMARY KEY,
  group_name varchar(30) NOT NULL,
  rooms varchar(30) 
);

INSERT INTO Groups ( group_id, group_name, rooms) VALUES ( 1,'IT', '101');
INSERT INTO Groups ( group_id, group_name, rooms) VALUES ( 2,'IT', '102');
INSERT INTO Groups ( group_id, group_name, rooms) VALUES ( 3,'Sales', '102');
INSERT INTO Groups ( group_id, group_name, rooms) VALUES ( 4,'Sales', 'Auditorium A');
INSERT INTO Groups ( group_id, group_name, rooms) VALUES ( 5,'Administation', null);
INSERT INTO Groups ( group_id, group_name, rooms) VALUES ( 6,'Operations', null);


SELECT * FROM Groups;

/* All groups, and the users in each group. A group should appear even if there are no users assigned to the group. */

SELECT DISTINCT g.group_name, u.user_name
  FROM groups g
		LEFT JOIN users u
       ON u.user_group = g.group_name
ORDER BY g.group_Name;

/* All rooms, and the groups assigned to each room. The rooms should appear even if no groups have been assigned to them. */

SELECT DISTINCT r.room_name, g.group_name
  FROM rooms r
		LEFT JOIN groups g
       ON r.room_name = g.rooms
ORDER BY r.room_name;

/* A list of users, the groups that they belong to, and the rooms to which they are assigned. This should be sorted alphabetically by user, then by group, then by room. */
SELECT DISTINCT u.user_name, u.user_group, g.rooms
  FROM users u
		LEFT JOIN groups g
       ON u.user_group= g.group_name
ORDER BY u.user_name, u.user_group, g.rooms;