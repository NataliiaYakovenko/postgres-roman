-- отримати віс виконані замовлення

SELECT *
FROM orders
WHERE status = TRUE;


CREATE TYPE order_status AS ENUM ('new', 'processing', 'shiped', 'done', 'canceled');

ALTER TABLE orders
ALTER COLUMN status 
TYPE order_status 
USING (
    CASE status
    WHEN false THEN 'processing'
    WHEN true THEN 'done'
    ELSE 'new'
    END
)::order_status;

INSERT INTO orders (costumer_id, status)
VALUES (1206, 'new')


SELECT *
FROM orders
ORDER BY create_at DESC


UPDATE orders
SET status = 'processing'
WHERE costumer_id = 1206


SELECT *
FROM orders
WHERE costumer_id = 1206