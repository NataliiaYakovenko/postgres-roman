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
INSERT INTO users
VALUES(
        'Nataliia',
        'Yakovenko',
        'I live in Zaporizhzha',
        'female',
        true,
        '1983.10.14',
        36,
        158.02
    );
INSERT INTO users
VALUES (
        'Lidia',
        'Yakovenko',
        'I live in Zaporizhzha',
        'female',
        true,
        '1954.01.07',
        37,
        159.09
    ),
    (
        'Roll',
        'Simonyn',
        'I live in Armeniia',
        'male',
        true,
        '1998.12.27',
        41,
        178.32
    );
INSERT INTO users
VALUES(
        'Bob',
        'Bobenko',
        'I live in Zaporizhzha',
        'male',
        false,
        '1999.06.17',
        NULL,
        NULL
    );