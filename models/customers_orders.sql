WITH orders_0 AS (

  SELECT * 
  
  FROM demo.orders

),

customers_0 AS (

  SELECT * 
  
  FROM demo.customers

),

by_customer_id AS (

  SELECT 
    orders_0.order_id AS order_id,
    orders_0.customer_id AS customer_id,
    customers_0.first_name AS first_name,
    customers_0.last_name AS last_name
  
  FROM orders_0
  INNER JOIN customers_0
     ON customers_0.customer_id = orders_0.customer_id

),

add_full_name AS (

  SELECT 
    order_id AS order_id,
    customer_id AS customer_id,
    concat(first_name, last_name) AS full_name
  
  FROM by_customer_id

)

SELECT * 

FROM add_full_name
