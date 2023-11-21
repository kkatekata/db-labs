/*Для каждого дня августа 2012 года рассчитайте скользящее среднее общего дохода за предыдущие 15 дней. 
Вывод должен содержать столбцы даты и дохода, отсортированные по дате. 
Не забудьте учесть возможность того, что в день будет нулевой доход. 
Примечание: используйте DATE_ADD для генерации серии дат.*/
USE cd;
SELECT 	DATE(b.starttime) AS date,
		SUM(IF(memid = 0, f.guestcost * b.slots, f.membercost * b.slots)) as revenue,
		AVG(IF(memid = 0, f.guestcost * b.slots, f.membercost * b.slots)) AS moving_average
FROM bookings b
LEFT JOIN facilities f ON b.facid = f.facid WHERE DATE(b.starttime) BETWEEN '2012-08-01' AND '2012-08-31'
GROUP BY DATE(b.starttime) HAVING DATE_ADD(date, INTERVAL 15 DAY) <= '2012-08-31' 
ORDER BY DATE(b.starttime);