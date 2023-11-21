/* Выберите список бронирований на 14 сентября 2012 г., чтоимость 
которых более 30. Включите в выходные данные название заведения, имя 
участника, отформатированное как одиночное столбец и стоимость. 
Упорядочивайте по убыванию стоимости и не используйте подзапросы.
Помните, что у гостей разные затраты по сравнению с участниками 
(указанные затраты указаны за получасовой «интервал»), а идентификатор 
гостя всегда имеет идентификатор 0.*/
SELECT DISTINCT
    fac.facility,
    CONCAT(mem.surname, ' ', mem.firstname) AS 'Участник',
    IF(book.memid = 0, fac.guestcost, fac.membercost) * book.slots AS 'Стоимость'
FROM cd.members as mem
    INNER JOIN cd.bookings as book ON book.memid = mem.memid
    INNER JOIN cd.facilities as fac ON book.facid = fac.facid
WHERE DATE(starttime) = '2012.09.14' AND IF(book.memid = 0, fac.guestcost, fac.membercost) * book.slots > 30
ORDER BY Стоимость DESC;