/*Task-7-2. Создайте таблицу payments со структурой (payid INT PK, FK on booking.bookid; payment  DECIMAL. Добавьте в таблицу bookings поле payed, смысл которого оплачена или не оплачена аренда. Создайте триггеры, которые 
Запрещают удаление записей, если они уже оплачены;
После отметки оплаты, заносят в таблицу  payments запись с соответствующим значением PK и суммой оплаты,  для вычисления которой используется функция созданная в Task-7-1.
При отмене оплаты - удаляет соответствующую запись в таблице payments.    
Напишите скрипт, который отмечает, что все аренды июля 2012 года оплачены. Посчитайте (написав соответствующий скрипт) оплату на июль 2012 года двумя способами: 
используя данные таблицы payments
используя только функцию из Task-7-1 и данные таблицы bookings.
		Сравните результаты расчета.
*/
USE cd;

-- Создание новой таблицы
CREATE TABLE payments
(
	payid INT PRIMARY KEY AUTO_INCREMENT,
 bookid INT,
	payment DECIMAL,
	FOREIGN KEY (bookid) REFERENCES bookings(bookid)
);

Добавление столбца
ALTER TABLE bookings
ADD payed BOOLEAN DEFAULT 0;

DELIMITER //

-- Триггер на удаление записи, если не оплачена
DROP TRIGGER IF EXISTS not_delete_if_false //
CREATE TRIGGER not_delete_if_false
  BEFORE DELETE ON bookings FOR EACH ROW 
  BEGIN
    CASE
	    WHEN OLD.payed = 1 THEN SIGNAL SQLSTATE '45000' SET message_text='Аренда уже оплачена!';
	    ELSE BEGIN END;
    END CASE;
  END //

-- Триггер на изменение статуса оплаты
DROP TRIGGER IF EXISTS on_pay_status //
CREATE TRIGGER on_pay_status
  AFTER UPDATE ON bookings FOR EACH ROW
  BEGIN
    CASE
      WHEN NEW.payed = OLD.payed THEN BEGIN END;
      WHEN NEW.payed = 1
        THEN INSERT INTO payments(bookid, payment)
              NEW.bookid, cost_of(NEW.memid, NEW.facid, NEW.slots)
      ELSE DELETE FROM payments WHERE payments.bookid = NEW.bookid;
    END CASE;
  END //

-- Триггер на добавление новой записи в букинг, если оно сразу оплачено
DROP TRIGGER IF EXISTS on_insert //
CREATE TRIGGER on_insert
  AFTER INSERT ON bookings FOR EACH ROW
  BEGIN
    CASE
      WHEN NEW.payed = 1
        THEN INSERT INTO payments(bookid, payment)
              NEW.bookid, cost_of(NEW.memid, NEW.facid, NEW.slots)
      ELSE BEGIN END;
    END CASE;
  END //

DELIMITER ;

-- Изменение статуса записей
UPDATE bookings
  SET payed = 1
  WHERE DATE(starttime) < '2012-08-01' AND DATE(starttime) >= '2012-07-01';

-- Подсчет суммы
SELECT SUM(payment) FROM payments;
SELECT SUM(cost_of(memid, facid, slots))
  FROM bookings
  WHERE DATE(starttime) < '2012-08-01' AND DATE(starttime) >= '2012-07-01';