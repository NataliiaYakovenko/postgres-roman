DROP TABLE users;
CREATE TABLE users(
    first_name VARCHAR(64) NOT NULL CHECK(first_name != ''),
    last_name VARCHAR(64) NOT NULL CHECK(last_name != ''),
    email VARCHAR(64) NOT NULL CHECK(email != '') UNIQUE,
    gender VARCHAR(30) NOT NULL CHECK(gender != ''),
    is_subscribe boolean NOT NULL,
    birthday date,
    foot_size smallint,
    height numeric(5, 2)
);
INSERT INTO users
VALUES(
        'Nataliia',
        'Yakovenko',
        'yakovenkonatali999@gmail.com',
        'female',
        true,
        '1983.10.14',
        36,
        158.02
    );
INSERT INTO users
VALUES(
        'Nataliia',
        'Yakovenko',
        'yakovenkonatali999@gmail.com',
        'female',
        true,
        '1983.10.14',
        36,
        158.02
    );