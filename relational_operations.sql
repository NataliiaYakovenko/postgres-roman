-- Реляційні операції

CREATE TABLE a(
   v char(3),
   t int
)

INSERT INTO a 
VALUES ('xxx', 1),
       ('xxy', 1),
       ('xxz', 1),
       ('xyx', 2),
       ('xyy', 2),
       ('xyz', 2),
       ('yxx', 3),
       ('yxy', 3),
       ('yxz', 3)




CREATE TABLE b (
   v char(3)
)

INSERT INTO b
VALUES ('zxx'),
       ('xxx'),
       ('zxz'),
       ('yxz'),
       ('yxy')


-- необхідно отримати дані з обох таблиць одночасно
SELECT * 
FROM a, b 

--отримуємо ДЕКАРТОВИЙ ДОБУТОК

--ДЕКАРТОВИЙ ДОБУТОК - це коли кожен елемент таблиці А помножує на кожен елемент таблиці В


--UNION - об'єднання множин, 
-- всі елементи з таблиці А додаються до всіх елементів з таблиці В
-- а елементи, що дублюються, залишаються тільки в одиночному вигляді

--INTERSECT - перетин множин
-- все те, що є співпадає з таблиці А з таблицею Б, відображається в одному екземплярі

--Різниця
-- А мінус В  - все з А мінус спільні елементи для А і В
-- В мінус А  - все з В мінус спільні елементи для В і А

--UNION - об'єднання множин
--отримуємо всі унікальні значення без дублювання
SELECT v
FROM a
UNION
SELECT * 
FROM b



--INTERSECT - перетин множин
-- отримали елементи в одному екземплярі, що є і в таблиці А і в таблиці В
SELECT v
FROM a
INTERSECT
SELECT * 
FROM b


--Різниця
-- отримуємо значення в таблиці А, яких немає в таблиці В
--отримуємо тільки значення з таблиці А, не включаються значення з таблиці А , які однакові з значенням табоиці В
SELECT v
FROM a
EXCEPT
SELECT * 
FROM b


--Різниця
-- отримуємо значення в таблиці B, яких немає в таблиці A
--отримуємо тільки значення з таблиці B, не включаються значення з таблиці B , які однакові з значенням табоиці A
SELECT *
FROM b
EXCEPT
SELECT v 
FROM a
//-------------------------------------------------------------------------

INSERT INTO users (first_name,last_name, email,gender,is_subscribe, birthday)
VALUES ('Bella', 'Swon', 'swon@gmail.com', 'female', true,'1999-06-23'),
       ('Joe', 'Trogan', 'trogan@gmail.com', 'male', true,'1997-03-13'),
       ('Liia', 'Nixon', 'nixon@gmail.com', 'female', false,'2000-09-18');

--Знайти id users які робили замовлення
SELECT id 
FROM users
INTERSECT
SELECT costumer_id
FROM orders
 
--знайти id users, які ніколи не робили замовлення
SELECT id 
FROM users
EXCEPT
SELECT costumer_id
FROM orders
