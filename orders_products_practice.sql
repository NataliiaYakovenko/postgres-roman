CREATE TABLE products(
    id SERIAL PRIMARY KEY
    name VARCHAR(300) CHECK(name != '') NOT NULL
);

CREATE TABLE manufacturers(
    id SERIAL PRIMARY KEY
    name VARCHAR(300) CHECK(name != '') NOT NULL
    adress TEXT CHECK(adress != '') NOT NULL
    tel_number VARCHAR(15) CHECK(tel_number != '') NOT NULL
);

CREATE TABLE orders(
    id SERIAL PRIMARY KEY
    product_id int REFERENCES products(id)
    quantity_plan int CHECK(quantity_plan > 0) NOT NULL
    product_price DECIMAL(10,2)
    contract_number VARCHAR(30) NOT NULL
    contract_adress TEXT CHECK(contract_adress != '') NOT NULL
    contract_date DATE NOT NULL
    manufacturer_id int REFERENCES manufacturers(id)
);

CREATE TABLE shipments(
    id SERIAL PRIMARY KEY
    order_id int REFERENCES orders(id)
    shipment_date TIMESTAMP NOT NULL
);

CREATE TABLE products_to_shipments(
    product_id int REFERENCES products(id)
    shipment_id int REFERENCES shipments(id)
    product_quantity int NOT NULL
);