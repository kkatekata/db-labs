/* Добавить (одновременно)  два сквош-корта (2 и 3 == ‘Squash Court 2’, ‘Squash Court 3’)  со стоимостью создания = 5000, стоимостью обслуживания = 80, стоимостью аренды для членов клуба = 3.5, а гостей - 17.5.*/
USE cd;
ALTER TABLE facilities
MODIFY membercost numeric(8,2),
MODIFY gestcost numeric(8,2);

INSERT facilities (facid,facility, membercost, guestcost, initialoutlay, monthlymaintenance)
VALUES 
(10,'Squash Court 2', 3.5, 17.5, 5000, 80),
(11,'Squash Court 3', 3.5, 17.5, 5000, 80);