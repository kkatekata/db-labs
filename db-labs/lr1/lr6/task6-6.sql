/*Task-6-6.  Выведите все объектов клуба, если они содержат в названии слово  ‘Tennis’ в произвольном регистре.*/
SELECT
    facility as facility
FROM cd.facilities
WHERE facility LIKE '%Tennis%';