/*Добавьте еще одно spa с такими же характеристиками как в задании 1, сгенерировав новое ID.*/
USE cd;
INSERT INTO facilities(facid, facility, membercost, guestcost, initialoutlay, monthlymaintenance)
SELECT 1 + (SELECT MAX(facid) FROM facilities), facility, membercost, guestcost, initialoutlay, monthlymaintenance
FROM facilities
WHERE facility LIKE 'Spa'
LIMIT 1;
