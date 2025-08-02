
BEGIN; 
--1 створили замовлення
INSERT INTO orders(costumer_id, status)
VALUES (1236, 'new')
RETURNING id;

-- наповнити замовлення
INSERT INTO orders_to_products(order_id, product_id,quntity)
VALUES (LASTVAL(), 1, 1),
       (LASTVAL(), 2, 3),
       (LASTVAL(), 3, 1);

COMMIT;

ROLLBACK;




