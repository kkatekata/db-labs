/*Составьте список имен и идентификаторов каждого участника, 
а также их первого бронирования после 1 сентября 2012 г. 
Упорядочите по идентификатору участника.*/
USE cd;
SELECT mem.memid, mem.firstname, min(book.starttime) as 'Первое бонирование после 01.09.2012' FROM members mem
JOIN bookings book ON mem.memid = book.memid
WHERE book.starttime > '2012-09-01'
GROUP BY mem.memid
ORDER BY mem.memid;