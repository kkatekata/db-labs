/*Найдите общее количество участников (члены + гости), 
совершивших хотя бы одно бронирование.*/
USE cd;
SELECT count(distinct memid) as people_count from bookings;