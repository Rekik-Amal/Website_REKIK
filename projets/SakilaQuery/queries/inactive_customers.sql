
SELECT
  c.first_name || ' ' || c.last_name AS customer,
  MAX(r.rental_date) AS last_rental,
  JULIANDAY('now') - JULIANDAY(MAX(r.rental_date)) AS days_since_last_rental
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id
HAVING days_since_last_rental > 90
ORDER BY days_since_last_rental DESC;
