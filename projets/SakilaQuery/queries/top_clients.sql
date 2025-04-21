
SELECT
  c.first_name || ' ' || c.last_name AS customer_name,
  ROUND(SUM(p.amount), 2) AS total_paid
FROM customer c
JOIN payment p ON p.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY total_paid DESC
LIMIT 10;
