/*Рассчитайте количество аренд каждого из объектов клуба.*/
USE cd;
SELECT fac.facility as Object_name, SUM(book.slots) AS Book_count FROM facilities fac
JOIN bookings book ON fac.facid=book.facid
GROUP BY Object_name;