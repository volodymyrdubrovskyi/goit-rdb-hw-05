/*
5. Створіть функцію з двома параметрами, яка буде ділити перший параметр на другий. Обидва параметри
та значення, що повертається, повинні мати тип FLOAT.
Використайте конструкцію DROP FUNCTION IF EXISTS. Застосуйте функцію до атрибута quantity 
таблиці order_details . Другим параметром може бути довільне число на ваш розсуд.
*/
DROP FUNCTION IF EXISTS divide_floats;

DELIMITER //

CREATE FUNCTION divide_floats(number1 FLOAT, number2 FLOAT)
RETURNS FLOAT
NO SQL
BEGIN
    RETURN number1 / number2;
END //

DELIMITER ;

SELECT order_id, quantity, divide_floats(quantity, 2.0) AS divided_quantity
FROM order_details;