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