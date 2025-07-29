-- Сортування

--ASC  - сортування від малого до великого (за замовченням)
--DESC - сортування від великого до малого

--відсортувати користувачів по даті народження
SELECT *
FROM users
ORDER BY birthday

--відсортувати користувачів по даті народження в зворотньому порядку
SELECT *
FROM users
ORDER BY birthday DESC

--відсортувати користувачів за first_name за абеткою, кожну групу birthday , я
SELECT *
FROM users
ORDER BY birthday ASC,
          first_name ASC


//--------------------------------------------------------------------
--додаємо значень кільковсті товарів в таблицю priducts
UPDATE priducts
SET quantity = 5     

--відсортувати кількість телефонів за кількістю кожного бренда
SELECT *
FROM priducts
ORDER BY quantity ASC


UPDATE priducts
SET quantity  = 2
WHERE brand ='Nokia'  

-- вивести 1 телефон яких залишилось найменше
SELECT *
FROM priducts
ORDER BY quantity 
LIMIT 1