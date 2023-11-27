/* Task-6-4.  Выведите список членов клуба, отформатированных как 'Surname, Firstname'*/

SELECT
    CONCAT(surname, ', ', firstname) as initials
FROM cd.members;