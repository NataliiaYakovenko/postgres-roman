
--Порахувати середній чек по всьому магазину
--запит знаходить суму кожного замовлення
SELECT otp.order_id, SUM(p.price * otp.quntity)
FROM orders_to_products AS otp JOIN priducts AS p
ON otp.product_id = p.id
GROUP BY otp.order_id

--Порахувати середній чек по всьому магазину
SELECT avg(owc.cost)
FROM (
     SELECT otp.order_id, SUM(p.price * otp.quntity) AS cost
     FROM orders_to_products AS otp JOIN priducts AS p
     ON otp.product_id = p.id
     GROUP BY otp.order_id
) AS owc
//------------------------------------------------------------------

--Витягти всі замовлення вище середнього чека
-- варіант 1
SELECT owc.*
FROM (
     SELECT otp.order_id, SUM(p.price * otp.quntity) AS cost
     FROM orders_to_products AS otp JOIN priducts AS p
     ON otp.product_id = p.id
     GROUP BY otp.order_id
) AS owc
WHERE owc.cost > (
     SELECT avg(owc.cost)
FROM (
     SELECT otp.order_id, SUM(p.price * otp.quntity) AS cost
     FROM orders_to_products AS otp JOIN priducts AS p
     ON otp.product_id = p.id
     GROUP BY otp.order_id
)  AS owc
)

--варіант 2
WITH orders_with_cost AS (
    SELECT otp.order_id, SUM(p.price * otp.quntity) AS cost
    FROM orders_to_products AS otp JOIN priducts AS p
    ON otp.product_id = p.id
    GROUP BY otp.order_id
)
SELECT * 
FROM orders_with_cost
WHERE orders_with_cost.cost > (
    SELECT avg(orders_with_cost.cost)
    FROM orders_with_cost
)
//-----------------------------------------------------------------------
--Витягти всіх користувачів, в яких кількість замовлень вище середнього

WITH orders_with_counts AS (
    --кількість замовлень кожного користувача
    SELECT costumer_id, count(*) AS orders_count
    FROM orders
    GROUP BY costumer_id
)
SELECT *
FROM orders_with_counts JOIN users
ON users.id = orders_with_counts.costumer_id
WHERE orders_with_counts.orders_count > (
    SELECT avg(orders_with_counts.orders_count)
    FROM orders_with_counts
)


--Витягти користувачів і кількість товарів, які вони замовляли

SELECT u.id,first_name,last_name, SUM(otp.quntity) AS "products_quantity"
FROM users AS u JOIN orders AS o
ON u.id = o.costumer_id 
               JOIN orders_to_products AS otp   
               ON o.id = otp.order_id       
GROUP BY u.id 