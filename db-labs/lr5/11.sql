/* Составьте список общего количества часов, забронированных на один объект, помня, что интервал длится полчаса. 
Выходная таблица должна состоять из идентификатора объекта, имени и забронированных часов, отсортированных по идентификатору объекта. 
Попробуйте отформатировать часы с точностью до двух десятичных знаков.*/SELECT
    fac.facid,
    fac.facility,
    SUM(book.slots) * 0.5 AS fachours
FROM cd.facilities as fac
LEFT JOIN cd.bookings as book ON book.facid = fac.facid
GROUP BY fac.facid
ORDER BY fac.facid;