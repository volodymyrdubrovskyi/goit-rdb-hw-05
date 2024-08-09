/*
1. Напишіть SQL запит, який буде відображати таблицю order_details та поле customer_id з 
таблиці orders відповідно для кожного поля запису з таблиці order_details.
*/
SELECT *, (SELECT o.customer_id FROM orders o WHERE o.id = od.order_id) AS customer_id
FROM order_details od;

/*
2. Напишіть SQL запит, який буде відображати таблицю order_details. 
Відфільтруйте результати так, щоб відповідний запис із таблиці orders виконував умову shipper_id=3.
*/
SELECT * FROM order_details 
WHERE order_id IN (SELECT id FROM orders WHERE shipper_id = 3);

/*
3. Напишіть SQL запит, вкладений в операторі FROM, який буде обирати рядки 
з умовою quantity>10 з таблиці order_details. 
Для отриманих даних знайдіть середнє значення поля quantity — групувати слід за order_id.
*/
SELECT order_id, AVG(quantity) AS average_quantity
FROM (SELECT order_id, quantity FROM order_details 
		WHERE quantity > 10) AS filtered_od
GROUP BY order_id;

/*
4. Розв’яжіть завдання 3, використовуючи оператор WITH для створення тимчасової таблиці temp.
*/
WITH temp AS (SELECT order_id, quantity FROM order_details WHERE quantity > 10)
SELECT order_id, AVG(quantity) AS average_quantity
FROM temp
GROUP BY order_id;