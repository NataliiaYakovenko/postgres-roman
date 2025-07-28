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