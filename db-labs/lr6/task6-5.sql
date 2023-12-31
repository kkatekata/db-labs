/*Task-6-5.  Выведите наименования всех объектов клуба заглавными буквами, если они содержат в названии слово ‘Tennis’*/
SELECT
    UPPER(facility) as facility
FROM cd.facilities
WHERE facility LIKE BINARY '%Tennis%' ;
/*Этот запрос выбирает название (facility) всех объектов (facilities) из таблицы cd.facilities,
 которые содержат слово "Tennis" (с учетом регистра), и преобразует все буквы в верхний регистр
  с помощью функции UPPER(). Ключевое слово LIKE используется для поиска соответствующих строк,
   а оператор BINARY указывает, что сравнение должно быть чувствительным к регистру.*/