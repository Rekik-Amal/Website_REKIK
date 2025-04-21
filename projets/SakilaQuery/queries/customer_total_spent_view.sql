
CREATE TEMP VIEW customer_total_spent AS
SELECT
  c.customer_id,
  c.first_name || ' ' || c.last_name AS customer,
  SUM(p.amount) AS total_spent
FROM customer c
JOIN payment p ON p.customer_id = c.customer_id
GROUP BY c.customer_id;
