DROP TABLE users;
CREATE TABLE users(
    first_name VARCHAR(64) NOT NULL CONSTRAINT first_name_not_empty CHECK(first_name != ''),
    last_name VARCHAR(64) NOT NULL CONSTRAINT last_name_not_empty CHECK(last_name != ''),
    email VARCHAR(64) NOT NULL CHECK(email != '') UNIQUE,
    gender VARCHAR(30) NOT NULL CHECK(gender != ''),
    is_subscribe boolean NOT NULL,
    birthday date CHECK(birthday <= current_date),
    foot_size smallint,
    height numeric(5, 2) CONSTRAINT too_height_user CHECK(height < 2.4)
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
        1.58
    );
INSERT INTO users
VALUES(
        'Nataliia',
        'Yakovenko',
        'natali999@gmail.com',
        'female',
        true,
        '1983.10.14',
        36,
        2.5
    );
INSERT INTO users
VALUES(
        'Nata',
        'Yakov',
        'n999@gmail.com',
        'female',
        true,
        '2025.06.20',
        36,
        1.5
    );