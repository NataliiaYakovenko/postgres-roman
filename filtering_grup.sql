--Filtering

--знайти кількість користувачів у кожній вікоій групі
--count(*) - кількість записів у стовпці
SELECT count(*), EXTRACT(YEARS FROM AGE(birthday)) AS "вікова група"
FROM users
GROUP BY "вікова група"


--знайти кількість користувачів у кожній вікоій групі, і зробити сортування по віковій групі
--count(*) - кількість записів у стовпці
SELECT count(*), EXTRACT(YEARS FROM AGE(birthday)) AS "вікова група"
FROM users
GROUP BY "вікова група"
ORDER BY "вікова група"


--знайти кількість користувачів, де у вікоій групі менше 250 користувачів
SELECT count(*), EXTRACT(YEARS FROM AGE(birthday)) AS "вікова група"
FROM users
GROUP BY "вікова група"
HAVING  count(*)  < 250

