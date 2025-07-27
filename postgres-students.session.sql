CREATE TABLE priducts_version_2 (
  id SERIAL PRIMARY KEY,
  brand VARCHAR (256) NOT NULL CHECK(brand != ''),
  model VARCHAR (256) NOT NULL CHECK(model != ''),
  price NUMERIC(8, 2) NOT NULL,
  is_luxury BOOLEAN GENERATED ALWAYS AS (price > 800) STORED
);
INSERT INTO priducts_version_2 (brand, model, price)
VALUES ('IPhone', '15Pro', 1300),
  ('Samsung', 'S10', 400),
  ('Redmi', '8Pro', 200);
ALTER TABLE priducts
ADD COLUMN is_luxury BOOLEAN GENERATED ALWAYS AS (price > 800) STORED;
UPDATE priducts
SET price = price * 3
WHERE price < 700;
INSERT INTO priducts (brand, model, price, category)
VALUES ('Nokia', 'New', 1400, 'phones')
RETURNING id;
INSERT INTO priducts (brand, model, price, category)
VALUES ('Nokia', '33333333', 1000, 'phones')
RETURNING *;
DELETE FROM users
WHERE id >= 867;
//-------------------------------------------------------------
CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    first_name varchar(64) NOT NULL CHECK(first_name !=''),
    last_name varchar(64) NOT NULL CHECK(last_name !=''),
    email text NOT NULL CHECK (email != ''),
    gender varchar(30),
    is_subscribe BOOLEAN NOT NULL,
    birthday DATE CHECK(birthday <= CURRENT_DATE),
    foot_size smallint,
    hight numeric (5,2) CHECK(hight < 0.3)
);

CREATE TABLE products(
       id SERIAL PRIMARY KEY,
       brand varchar(200) NOT NULL CHECK(brand !=''),   
       model varchar(200) NOT NULL CHECK(model !=''),
       description text,
       category varchar(200) NOT NULL CHECK(category != ''),
       price numeric (10, 2) NOT NULL CHECK(price > 0),
       dickounted_price numeric(10,2) CHECK(dickounted_price < price),
       quantity int CHECK(quantity >=0)
);

CREATE TABLE orders(
    id SERIAL PRIMARY KEY,
    create_ad timestamp NOT NULL DEFAULT current_timestamp,
    custamer_id int REFERENCES users(id)
    );

CREATE TABLE orders_to_products(
  order_id int REFERENCES orders(id),
  product_id int REFERENCES products(id),
  quantity int DEFAULT 1 NOT NULL,
  PRIMARY KEY (order_id, product_id)
);



DROP TABLE orders_to_products;

DELETE FROM orders;

DROP TABLE priducts;

DROP TABLE priducts_version_2; 

DROP TABLE users;