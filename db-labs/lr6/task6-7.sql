/*Task-6-7. Подсчитайте количество участников, чья фамилия начинается на определенную букву, отсортировав по буквам в порядке убывания. */
USE cd;
SELECT LEFT(surname,1) AS first_letter, COUNT(*) AS count_members
FROM members
GROUP BY first_letter
ORDER BY first_letter DESC;