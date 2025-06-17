DROP TABLE books,
coordinates,
messages;


CREATE TABLE orders(
    id SERIAL PRIMARY KEY,
    create_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    costumer_id INT REFERENCES users(id)
);

DROP TABLE orders;

ALTER TABLE users
ADD COLUMN id SERIAL PRIMARY KEY;

CREATE TABLE orders_to_products(
    product_id INT REFERENCES priducts(id),
    order_id INT REFERENCES orders(id),
    quntity INT,
    PRIMARY KEY(order_id,product_id)
);

-- Оформлення замовлення для якогось юзера
--1 створили замовлення
INSERT INTO orders (costumer_id)
VALUES (1);

--2 Наповнити замовлення
INSERT INTO orders_to_products (
    product_id,
    order_id,
    quntity
  )
VALUES
 (1,1,1),
 (2,1,2),
 (3,1,1);