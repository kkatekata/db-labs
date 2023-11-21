/* Выберите список всех членов, включая человека, который их 
рекомендовал (если таковой имеется), без использования каких-либо 
объединений. Исключите в списке дубликаты, упорядочите лист по ФИО (==   
имя + фамилия).*/

SELECT CONCAT(m1.surname, ' ', m1.firstname) AS 'Участник', 
    (SELECT CONCAT(m2.surname, ' ', m2.firstname) FROM cd.members m2 
    WHERE m2.memid = m1.recommendedby) AS 'Рекомендован' FROM cd.members m1
WHERE m1.memid != 0
ORDER BY Участник;