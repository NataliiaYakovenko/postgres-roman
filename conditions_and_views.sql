SELECT *
FROM users
WHERE gender IS NULL;

ALTER TABLE orders
ADD COLUMN status boolean;

--оновити парні id
UPDATE orders
SET status = true
WHERE id % 2 = 0;


--оновити не парні id
UPDATE orders
SET status = false
WHERE id % 2 = 1;

SELECT *
FROM orders
ORDER BY id ASC;

SELECT id,create_at,costumer_id,status AS order_status
FROM orders

//------------------------------------------------------------
--CASE


/*1 vrsion
CASE
   WHEM condition1 = true
   THEN result1
   WHEN conditio2 = true
   THEN result2

   ELSE resalt3
END;   
*/

--Вивести всі замовлення
-- там де статус true написати виконано
--там статус false - написати нове замовлення

SELECT id,create_at,costumer_id,status, (
    CASE
    WHEN status = true
    THEN 'виканоно'
    WHEN status = false
    THEN 'нове'
    ELSE 'інший статус'
    END
) AS order_status
FROM orders
ORDER BY id;






/*2 vrsion
CASE condition WHEM value1 THEN result1
               WHEM value2 THEN result2
ELSE default result
END;  

Витягнути місяць народження юзера, народився восени, влітку, навесні, взимку
*/

SELECT * , (
    CASE EXTRACT(MONTH FROM birthday)
    WHEN 1 THEN 'winter'
    WHEN 2 THEN 'winter'
    WHEN 3 THEN 'spring'
    WHEN 4 THEN 'spring'
    WHEN 5 THEN 'spring'
    WHEN 6 THEN 'summer'
    WHEN 7 THEN 'summer'
    WHEN 8 THEN 'summer'
    WHEN 9 THEN 'autumn'
    WHEN 10 THEN 'autumn'
    WHEN 11 THEN 'autumn'
    WHEN 12 THEN 'winter'
ELSE 'unkown'
END
) 
FROM users 
