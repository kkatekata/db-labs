 /*Выберите теннисные корты, забронированные пользователями на 
19 сентября 2012 года.*/
SELECT CONCAT(mem.firstname,' ', mem.surname) AS membername,
       CONCAT(rec.firstname,' ', rec.surname) AS recname
  FROM cd.members AS mem
    LEFT JOIN cd.members AS rec ON mem.recommendedby = rec.memid 
  WHERE mem.memid != 0 ORDER BY mem.surname;