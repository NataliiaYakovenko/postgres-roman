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

--знайти id users, які робили замовлення
SELECT *
FROM users AS u JOIN orders AS o 
ON u.id = o.costumer_id

--знайти id users, і сумарну кілкість замовлень кожного юзера
SELECT u.*, count(*)
FROM users AS u JOIN orders AS o 
ON u.id = o.costumer_id
GROUP BY u.id


--знайти id users, які ніколи не робили замовлення
SELECT *
FROM users AS u LEFT JOIN orders AS o 
ON u.id = o.costumer_id
WHERE o.costumer_id IS NULL

--варіант 2
SELECT *
FROM users
WHERE id IN (
       SELECT id
       FROM users
       EXCEPT
       SELECT costumer_id
       FROM orders
)

//------------------------------------------------------------------
INSERT INTO priducts (brand,model,category,price,quantity)
VALUES ('iPhone','16','phones', 1500, 9 );

--Знайдіть телефони, які ніхто не купував
SELECT *
FROM priducts AS p LEFT JOIN orders_to_products AS otp 
ON p.id = otp.product_id
WHERE otp.product_id IS NULL

--Знайдіть кількість позицій у кожному замовлені
--Потрібно створити групу по order_id,
SELECT order_id, count(*) AS "quantity"
FROM orders_to_products
GROUP BY order_id

--Знайти найпопулярніший товар
SELECT brand, count(*)
FROM orders_to_products AS otp JOIN priducts AS p
ON p.id = otp.product_id
GROUP BY p.brand 
ORDER BY count(*) DESC
LIMIT 1



