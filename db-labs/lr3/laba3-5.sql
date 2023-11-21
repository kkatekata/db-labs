/* Выберите ФИО (== имя + фамилия) всех, кто покупал корты 1 и 2.*/
SELECT DISTINCT CONCAT(firstname,' ', surname) as membername 
  FROM cd.members 
    JOIN cd.bookings ON bookings.memid = members.memid 
    JOIN cd.facilities ON facilities.facid = bookings.facid
  WHERE facility LIKE '%Court 1%' OR facility LIKE '%Court 2%';