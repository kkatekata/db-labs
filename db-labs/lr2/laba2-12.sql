/* Найдите дату последней регистрации члена клуба.*/
USE cd;

SELECT MAX(joindate) FROM members;