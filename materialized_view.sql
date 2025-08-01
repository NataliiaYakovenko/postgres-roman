-- Потрібно порахувати кількість замовлень

CREATE MATERIALIZED VIEW total_orders AS (
    SELECT count(*) AS "загальна кількість замовлень"
    FROM orders
);

SELECT *
FROM total_orders;


INSERT INTO orders (costumer_id, status)
VALUES (
      1237,
      false
  );

SELECT *
FROM orders
WHERE costumer_id =1237;  

REFRESH MATERIALIZED VIEW total_orders

CREATE FUNCTION refresh_materialized_view ()
RETURNS void
AS
$$
BEGIN
       REFRESH MATERIALIZED VIEW total_orders;
END;
$$
LANGUAGE plpgsql;

SELECT refresh_materialized_view()
