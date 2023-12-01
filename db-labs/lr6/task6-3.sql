/*Task-6-3. Выберите процент использования объектов по месяцам, упорядочив по возрастанию*/
USE cd;
WITH slots as (
  SELECT facility, SUM(book.slots) as rent_count,
      DATE_FORMAT(book.starttime, "%m %Y") as date
    FROM facilities as fac
      JOIN bookings as book ON book.facid = fac.facid
    GROUP BY fac.facid, date
)
SELECT s1.facility, CONCAT(ROUND(s1.rent_count / SUM(s2.rent_count) * 100, 1), '%') as usability,
    s1.date
  FROM slots as s1
    JOIN slots as s2 ON s1.date = s2.date
  GROUP BY s1.facility, s1.rent_count, s1.date
  ORDER BY CAST(usability as FLOAT) ASC;
  /*Описание кода
1. Создает временную таблицу "slots", которая содержит информацию о количестве забронированных слотов для каждого объекта (facility), даты бронирования (date) и общего количества забронированных слотов для этой даты.

2. Выбирает из таблицы "slots" информацию о каждом объекте, процентном использовании объекта (usability) и дате бронирования.

3. Объединяет таблицу "slots" саму с собой по дате бронирования.

4. Группирует результаты по объекту, количеству забронированных слотов и дате бронирования.

5. Сортирует результаты по возрастанию процентного использования объекта.*/