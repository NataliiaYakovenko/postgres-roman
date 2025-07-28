-- вибрати всю інформацію з таблиці 
SELECT *
FROM users -- отримати конкретні стовпці з таблиці
SELECT id,
    first_name,
    last_name
FROM users --отримати юзерів, у яких id > 100
SELECT id,
    first_name
FROM users
WHERE id >= 100 --отримати всіх користувачів жіного полу
SELECT id,
    first_name,
    last_name,
    gender
FROM users
WHERE gender = 'female' --отримати користувачів, які підписались на нашу розсилку
SELECT id,
    first_name,
    last_name,
    is_subscribe
FROM users
WHERE is_subscribe IS TRUE --отримати користувачів, які НЕ підписались на нашу розсилку
SELECT id,
    first_name,
    last_name,
    is_subscribe
FROM users
WHERE is_subscribe IS NOT TRUE --знайти користувачів. у яких висота НЕ null
SELECT first_name,
    last_name,
    height
FROM users
WHERE height IS NOT null --знайти усіх користувачів з ім'ям Clara
SELECT first_name,
    last_name
FROM users
WHERE first_name = 'Clara'
SELECT first_name,
    last_name
FROM users
WHERE first_name LIKE 'Clara' --знайти користувачів з ім'ям Clara, Philip,Adelina
SELECT first_name,
    last_name
FROM users
WHERE first_name IN ('Clara', 'Philip', 'Adelina') --знайти користувачів БЕЗ імен Clara, Philip,Adelina
SELECT first_name,
    last_name
FROM users
WHERE first_name NOT IN ('Clara', 'Philip', 'Adelina') --отримати корисувачів, у яких id в діапазоні між 1000 і 1100
SELECT id,
    first_name,
    last_name
FROM users
WHERE id >= 1000
    AND id <= 1100
SELECT id,
    first_name,
    last_name
FROM users
WHERE id BETWEEN 1000 AND 1100 --знайти всіх користувачів ім'я яких починається на N
SELECT first_name,
    last_name
FROM users
WHERE first_name LIKE 'N%' --% будь яка кількість символів
    --знайти всіх корстувачів, у яких рівно 5 символів в імені
SELECT first_name,
    last_name
FROM users
WHERE first_name LIKE '_____' -- _ -це 1 будь-який символ
    --знайти всіх корстувачів, у яких рівно 3 символів в імені і починається на літеру А
SELECT first_name,
    last_name
FROM users
WHERE first_name LIKE 'A__' --знайти всіх користувачів, у яких ім'я закінчується на 'a'
SELECT first_name,
    last_name
FROM users
WHERE first_name LIKE '%a' --% будь яка кількість символів
    // ----------------------------------------------------------------------
    --Додаємо стовпець до таблиі users вагу користувача
ALTER TABLE users
ADD COLUMN weight int CHECK(
        weight != 0
        AND weight > 0
    ) --всім користувачам вказуємо вагу 60
UPDATE users
SET weight = 60 --користувачам, які мають id в діапазоні від 1200 до 1300 встановити вагу 70кг
UPDATE users
SET weight = 70
WHERE id BETWEEN 1200 AND 1300 -- перевіряємо
SELECT id,
    first_name,
    last_name,
    weight
FROM users
WHERE id BETWEEN 1200 AND 1300 --користувачу id 1400 встановити вагу 95
UPDATE users
SET weight = 95
WHERE id = 1400 --перевіряємо
SELECT id,
    first_name,
    last_name,
    weight
FROM users
WHERE id = 1400


 
 // == == == == == == == == == == == == == == == == == == == == == == == == == == == == == =
--додати новго користувача
INSERT INTO users (
        first_name,
        last_name,
        email,
        gender,
        is_subscribe,
        birthday
    )
VALUES ('Den', 'Dregon', 'den@gmail.com', 'male', TRUE, '1999-08-12')
RETURNING *;INSERT INTO users (
        first_name,
        last_name,
        email,
        gender,
        is_subscribe,
        birthday
    )
VALUES ('Den', 'Dregon', 'den@gmail.com', 'male', TRUE, '1999-08-12')
RETURNING *;

SELECT *
FROM users
WHERE first_name = 'Den'

--видалити доданого корстувача по id 3010
DELETE
FROM users
WHERE id = 3010




