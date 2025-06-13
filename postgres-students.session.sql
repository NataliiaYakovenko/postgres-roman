DROP TABLE users;
CREATE TABLE users(
    first_name VARCHAR(64),
    last_name VARCHAR(64),
    biography text,
    gender VARCHAR(30),
    is_subscribe boolean,
    birthday date,
    foot_size smallint,
    height numeric(5, 2)
);