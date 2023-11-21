/*3: Выберите членов клуба, которые рекомендовали других членов 
для вступления*/
USE cd;
SELECT * FROM members WHERE recommendedby IS NOT NULL;
SELECT DISTINCT m1.memid, m1.surname, m1.firstname FROM members m1 JOIN members m2 ON m1.memid = m2.recommendedby;