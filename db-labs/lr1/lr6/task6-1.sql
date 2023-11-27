/*Task-6-1. Выберите начальное и конечное время последних 10 аренд  объектов, упорядочив их по времени их окончания.*/
SELECT facid
,   starttime
,   DATE_ADD(starttime, INTERVAL (30 * slots) MINUTE) as endtime
FROM cd.bookings
ORDER BY endtime DESC
LIMIT 10;