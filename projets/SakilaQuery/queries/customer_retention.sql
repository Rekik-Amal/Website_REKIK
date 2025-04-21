
SELECT
  c.first_name || ' ' || c.last_name AS customer,
  MIN(p.payment_date) AS first_payment,
  MAX(p.payment_date) AS last_payment,
  ROUND(JULIANDAY(MAX(p.payment_date)) - JULIANDAY(MIN(p.payment_date)), 1) AS retention_days
FROM customer c
JOIN payment p ON p.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY retention_days DESC
LIMIT 10;
