--Агрегатні функції
--COUNT, SUM, AVG, MIN, MAX

--Знайти максимальну вагу в таблиці users
SELECT max(weight)
FROM users

--Знайти мінімальну вагу в таблиці users
SELECT min(weight)
FROM users

--Отримати сумарну вагу всіх користувачів одночасно
SELECT sum(weight)
FROM users

--Отримати середню вагу всіх корсувачів
SELECT avg(weight)
FROM users

--Підрахувати кількість записів в таблиці
-- в count() переедається стовпець, в якому 100% не має NULL
SELECT count(id)
FROM users

--знайти окремо середню вагу чоловіків і середню вагу жінок
SELECT gender, avg(weight)
FROM users
GROUP BY gender

--знайти середню вагу чоловіків
SELECT avg(weight)
FROM users
WHERE gender = 'male'

--знайти середню вагу користувачів, які старші 30 років
SELECT avg(weight)
FROM users
WHERE EXTRACT(YEAR FROM AGE(birthday)) > 30

//-----------------------------------------------------------
--Таблиця priducts
--Порахувати скільки всього товарів
SELECT count(id)
FROM priducts

--Порахувати середню ціну товарів
SELECT avg(price)
FROM priducts

--Порахувати середню ціну кожного бренду
SELECT brand, avg(price)
FROM priducts
GROUP BY brand

--Порахувати кількість моделей кожного бренду
SELECT brand, count(model)
FROM priducts
GROUP BY brand

--Порахувати середню ціну бренду Nokia
SELECT avg(price)
FROM priducts
WHERE brand = 'Nokia'