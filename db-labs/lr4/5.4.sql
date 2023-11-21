/*Стоимость аренды объектов 0 и 1 изменилась (член клуба == 6, гость = 30). Обновите данные в таблицах.*/
UPDATE cd.facilities
  SET membercost = 6, guestcost = 30
  WHERE facid IN (0, 1);