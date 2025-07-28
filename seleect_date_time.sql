-- оновлюємо дату народження чоловікам, які підписані на нашу розсилку
UPDATE users
SET birthday = '2000-01-01'
WHERE (gender = 'male' AND is_subscribe)

UPDATE users
SET birthday = '2005-05-05'
WHERE (gender = 'male' AND is_subscribe = 'false')

UPDATE users
SET birthday = '209-09-09'
WHERE (gender = 'female' AND is_subscribe)

UPDATE users
SET birthday = '2010-04-04'
WHERE (gender = 'female' AND is_subscribe = 'false')


-- Вивести всіх користувачів з інформацією + вік
--  age(birthday) - функція, яка вираховує вік позичальника
SELECT id,first_name, last_name, birthday, age(birthday)
FROM users
-- варіант 2
SELECT id,first_name, last_name, birthday, extract('years' from age(birthday))
FROM users

//------------------------------------------------------------------
-- make_interval(years, month, days) - функція, яка створює власний інтервал
SELECT id,first_name, last_name, make_interval(40,8,20)
FROM users
//--------------------------------------------------------------------------

-- Знайти користувачів віком від 14 до 20 років
SELECT id,first_name, last_name, birthday, extract('years' from age(birthday))
FROM users
WHERE extract('years' from age(birthday)) BETWEEN 14 AND 20

-- АЛІАСИ або ПСЕВДОНІМИ
-- українські слова відображаються в подвійних ліпках " "
SELECT id AS "особливий номер", first_name AS "ім'я", last_name AS "прізвище", extract('years' from age(birthday)) AS years
FROM users

//----------------------------------------------------------------------

--ПАГІНАЦІЯ
-- сторінки
-- яка кількість результатів буде на одній сторінці

-- отримати тільки 50 користувачів
SELECT id,first_name, last_name
FROM users
LIMIT 50


-- отримати тільки 50 користувачів на другій сторінці
SELECT id,first_name, last_name
FROM users
LIMIT 50
OFFSET 50

--Як нам дізнатися скілька потрібно відступати
-- формула для розрахунку OFFSET
--  OFFSET * сторінку, яку ми запитуємо -1
