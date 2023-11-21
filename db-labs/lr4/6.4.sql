/*Увеличьте стоимость аренды  корта 1 (facid = 0) на 10% для членов и гостей.*/
UPDATE cd.facilities
  SET membercost = membercost * 1.1, guestcost = guestcost * 1.1
  WHERE facid = 1;