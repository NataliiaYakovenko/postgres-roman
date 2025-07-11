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



DROP TABLE orders_to_products;

DROP TABLE orders;

DROP TABLE priducts;

DROP TABLE priducts_version_2; 

DROP TABLE users;