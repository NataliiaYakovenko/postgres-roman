CREATE TABLE priducts(
    id SERIAL PRIMARY KEY,
    brand VARCHAR(200) NOT NULL CHECK(brand != ''),
    model VARCHAR(300) NOT NULL CHECK(model != ''),
    description TEXT,
    category VARCHAR(200) NOT NULL CHECK(category != ''),
    price NUMERIC(10, 2) NOT NULL CHECK(price > 0),
    dicounted_price NUMERIC(10, 2) CHECK(dicounted_price <= price)
);
DROP TABLE priducts;
INSERT INTO priducts(brand, model, category, price)
VALUES(
        'Samsung',
        'Pro10',
        'Smarthone',
        200
    ),
    (
        'Redmi',
        'Pro',
        'Smarthone',
        1200
    ),
    ('Sonny', 'pro', 'TV', 700),
    ('Samsung', 'pro', 'TV', 300);
ALTER TABLE priducts
ADD CONSTRAINT "unique_brand_model_pair" PRIMARY KEY(brand, model);
INSERT INTO priducts(brand, model, category, price)
VALUES(
        'Samsung',
        'Pro10',
        'Smarthone',
        20
    );
ALTER TABLE priducts
ADD COLUMN quantity INTEGER;
ALTER TABLE priducts
ADD CONSTRAINT "products_quantity_check" CHECK(quantity >= 0);
ALTER TABLE priducts DROP CONSTRAINT "products_quantity_check";
ALTER TABLE priducts DROP COLUMN quantity;
// --------------------------------------------------------------------------------------------


CREATE TABLE books(
    id SERIAL PRIMARY KEY,
    author VARCHAR(260),
    title VARCHAR(200),
    year_publication SMALLINT CONSTRAINT year_publica_Later_current_date CHECK(year_publication <= EXTRACT(YEAR FROM CURRENT_DATE)), 
    publoshing_house VARCHAR(260) CONSTRAINT publoshing_house_not_empty CHECK(publoshing_house != ''),
    category VARCHAR(250) CONSTRAINT category_not_empty CHECK(category != ''),
    description TEXT, 
    quantity INTEGER,
    is_published BOOLEAN
);

DROP TABLE books;

INSERT INTO books(author,title,quantity)
VALUES('Taras Shevchenko', 'Dream', 300);

ALTER TABLE books
ADD CONSTRAINT "quantity_not_negative" CHECK(quantity >= 0);

INSERT INTO books(author,title,quantity)
VALUES('Shevchenko', 'Home', -300);

ALTER TABLE books
ADD CONSTRAINT "author_title" UNIQUE(author, title);

INSERT INTO books(author,title,quantity)
VALUES('Taras', 'D', 800);
