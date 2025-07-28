CREATE TABLE emploees(
    id SERIAL PRIMARY KEY,
    first_name varchar(64) NOT NULL CHECK(first_name != ''),
    salary NUMERIC(10, 2) NOT NULL CHECK(salary >= 0),
    work_hours NUMERIC(5, 2) NOT NULL CHECK(work_hours  >= 0)
)

INSERT INTO emploees (first_name, salary, work_hours)
VALUES ('Nataliia', 100000, 120),
       ('Evgen', 150000, 120),
       ('Roll', 160000, 120)


--Всім співробітникам, які відпрацювали більше 100 годин збільшити заробітну плату на 20%
UPDATE emploees
SET salary = salary * '1.2'
WHERE work_hours > 100  
--перевіряємо
SELECT *
FROM emploees     

