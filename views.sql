--вивести всі юзерів + скільки хто зробив замовлень
SELECT u.id,first_name,last_name,email, count(o.id) AS orders_amount
FROM users AS u LEFT JOIN orders AS o
ON u.id = o.costumer_id
GROUP BY u.id
ORDER BY orders_amount;


CREATE VIEW users_with_orders_amount AS (
SELECT u.id,first_name,last_name,email, count(o.id) AS orders_amount
FROM users AS u LEFT JOIN orders AS o
ON u.id = o.costumer_id
GROUP BY u.id
ORDER BY orders_amount
);

SELECT * 
FROM users_with_orders_amount;


-- отримати email юзерів, які мають менше двох замовлень
SELECT email , orders_amount
FROM users_with_orders_amount
WHERE orders_amount < 2

--якщо потрібно замінити, оновити таблицб VIEW
CREATE OR REPLACE VIEW  users_with_orders_amount AS (
SELECT u.id,first_name,last_name,email, count(o.id) AS orders_amount
FROM users AS u LEFT JOIN orders AS o
ON u.id = o.costumer_id
GROUP BY u.id
ORDER BY orders_amount
);

--можна видаляти VIEW через DROP VIEW users_with_orders_amount

-- створити представлення, яке зберігає замовлення з шчнью вартість
--додаємо інформацію про id замовника
CREATE OR REPLACE VIEW orders_with_price AS (
  SELECT o.id, o.costumer_id, SUM(p.price * otp.quntity) AS "order_sum", o.status
    FROM orders AS o JOIN orders_to_products AS otp
    ON o.id = otp.order_id
    JOIN priducts AS p
    ON p.id = otp.product_id
    GROUP BY o.id
);

DROP VIEW orders_with_price

--вивести юзерів з сумою коштів, яку вони витратили у магазині
SELECT u.id, u.email, SUM(owp.order_sum) AS "sum"
FROM users AS u LEFT JOIN orders_with_price AS owp 
ON u.id = owp.costumer_id
GROUP BY u.id
ORDER BY "sum"


