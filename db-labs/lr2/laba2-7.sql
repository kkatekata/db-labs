/*Выбрать объекты с ID равным 1 и 5*/
USE cd;
SELECT facility from facilities
WHERE facid IN (1,5);