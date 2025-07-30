-- оператор JOIN (з'єднання таблиць)
SELECT *
FROM a

SELECT *
FROM b

--отримати одночасно елементи з таблиць а,b , які однакові в обох таблицях
SELECT *
FROM a,b
WHERE a.v = b.v

--отримати одночасно елементи з таблиць а,b , які однакові в обох таблицях
--застосовую АЛІАСИ
SELECT a.v AS "значення А", a.t AS "кількість А", b.v AS "значення В"
FROM a,b
WHERE a.v = b.v

--використовуємо JOIN
SELECT *
FROM a JOIN b 
ON a.v = b.v

--знайти всі замовлення юзера, у якого id = 1699
SELECT *
FROM users AS u JOIN orders AS o 
ON u.id = o.costumer_id
WHERE u.id = 1699

SELECT u.*, o.id
FROM users AS u JOIN orders AS o 
ON u.id = o.costumer_id
WHERE u.id = 1699

--з'єднати, три таблиці
SELECT *
FROM a JOIN b ON a.v = b.v
       JOIN priducts AS p ON p.id = a.t

--знайти id всіх замовлень, де були замовлені телефони Samsung
SELECT *
FROM orders_to_products AS otp JOIN priducts AS p
ON p.id = otp.product_id
WHERE p.brand = 'Samsung'   

--Порахуйте скільки замовлень телефона Samsung
SELECT count(*)
FROM orders_to_products AS otp JOIN priducts AS p
ON p.id = otp.product_id
WHERE p.brand = 'Samsung' 

--зробити топ продажей. Який бренд частіше купували
SELECT brand, count(*)
FROM orders_to_products AS otp JOIN priducts AS p
ON p.id = otp.product_id
GROUP BY p.brand

--відсортувати по кількості
SELECT brand, count(*) AS "quantity"
FROM orders_to_products AS otp JOIN priducts AS p
ON p.id = otp.product_id
GROUP BY p.brand
ORDER BY "quantity"
