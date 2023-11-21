/*Создайте монотонно увеличивающийся нумерованный список участников (включая гостей), упорядоченный по дате присоединения. 
Помните, что идентификаторы участников не обязательно будут последовательными. Используйте функцию нумерации row_number.*/
SELECT
    ROW_NUMBER() OVER (
        ORDER BY mem.joindate
    ) as '#',
    mem.memid,
    mem.firstname,
    mem.surname,
    mem.joindate
FROM cd.members as mem
GROUP BY mem.memid
ORDER BY mem.joindate