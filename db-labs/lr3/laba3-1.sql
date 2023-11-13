SELECT starttime FROM cd.bookings 
WHERE memid = (SELECT memid FROM cd.members WHERE firstname = 'David' AND surname = 'Farrell');
/*выбрать даты начала бронирования и идентификатор члена клуба David Farrell со связными данными в таблице bookings/*