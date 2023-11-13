SELECT facilities.facility FROM cd.facilities
INNER JOIN cd.bookings ON facilities.facid = bookings.facid
WHERE facilities.facility LIKE '%Tennis Court%' AND DATE(bookings.starttime) = '2012-09-19';
/* Выберите теннисные корты, забронированные пользователями на 
19 сентября 2012 года./*