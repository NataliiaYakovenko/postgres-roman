CREATE DATABASE poman_students;


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
