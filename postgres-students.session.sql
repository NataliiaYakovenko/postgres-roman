DROP TABLE test;
--Як виконати запит Ctrl E (2 рази)
/*
 char(5)   передаємо "1,2,3,4,5,6,7" - передається помилка
 varchar(5)  передаємо "1,2,3,4,5,6,7" - передається помилка
 text     max 1GB
 */
CREATE TABLE users(
    first_name varchar(64),
    last_name varchar(64),
    biography text
);