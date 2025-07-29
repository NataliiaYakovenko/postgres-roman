CREATE TABLE workers(
    id SERIAL PRIMARY KEY,
    name varchar(64) NOT NULL CHECK(name != ''),
    salary NUMERIC(10, 2) NOT NULL CHECK(salary >= 0),
    birthday DATE CHECK(birthday <= CURRENT_DATE)
)

INSERT INTO workers (name, salary, birthday)
VALUES ('Nataliia', 100000, '1983-10-14'),
       ('Evgen', 150000, '1976-01-27'),
       ('Roll', 160000, '1997-12-27')

--Додайте робітника Олег з зп 300
--Додайте робітницю Ярославу з зп 500
INSERT INTO workers (name, salary, birthday)
VALUES ('Oleg', 300, '1984-11-24'),
       ('Yaroslava', 500, '2006-05-25')

--Додайте двох працівників одним запитом
-- Sasha зп 1000
-- Masha зп 200     
INSERT INTO workers (name, salary, birthday)
VALUES ('Sasha', 1000, '1985-09-09'),
       ('Masha', 200, '2005-03-23')   

--Встановити зп Олегу 500
UPDATE workers
SET salary = 500
WHERE id = 4

--Користувачі, які мають зп більше 500, знизити до 400
UPDATE workers
SET salary = 400
WHERE salary > 500

-- вибрати працівників, які мають зп більше 400
SELECT *
FROM workers
WHERE salary > 400

--вибрати працівника з id 4
SELECT *
FROM workers
WHERE id = 4

-- дізнатися зп та вік Nataliia
SELECT id, name, salary, birthday, age(birthday)
FROM workers
WHERE name = 'Nataliia'

-- 2 ВІРНИЙ ВАРІАНТ
SELECT *, EXTRACT(YEARS FROM age(birthday)) 
FROM workers
WHERE name = 'Nataliia'

--знайти працівника з ім'ям 'Evgen'
SELECT *
FROM workers
WHERE name = 'Evgen'

--знайти робітників, які мають вік 41 або отримають зп < 500
SELECT *, EXTRACT(YEAR FROM AGE(birthday)) AS age
FROM workers
WHERE EXTRACT(YEAR FROM AGE(birthday)) = 41 OR salary < 500;

--вибрати всіх робітників у віці від 35 до 50 років
SELECT * , EXTRACT(YEAR FROM AGE(birthday)) AS age
FROM workers
WHERE EXTRACT(YEAR FROM AGE(birthday)) BETWEEN 35 AND 50

--вибрати всіх співробітників, що народились у вересні
SELECT *
FROM workers
WHERE EXTRACT(MONTH FROM birthday) = '09'

--видалити робітника з id 3
DELETE 
FROM workers
WHERE id = 3

--видалити робітника з ім'ям Oleg
DELETE 
FROM workers
WHERE name = 'Oleg'

--видалити всіх робітників молодше за 30 років
DELETE 
FROM workers
WHERE EXTRACT(YEAR FROM AGE(birthday)) < 30
