/*Добавьте еще одно spa с такими же характеристиками как в задании 1, сгенерировав новое ID.*/
USE cd;
INSERT facilities
SELECT (SELECT MAX(facid)+1 FROM facilities), facility, membercost, guestcost, initialoutlay, monthlymaintenance FROM facilities where facid = 9;
SELECT * FROM facilities;