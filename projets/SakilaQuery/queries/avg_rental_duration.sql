
SELECT
  f.title,
  ROUND(AVG(JULIANDAY(r.return_date) - JULIANDAY(r.rental_date)), 2) AS avg_rental_days
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON r.inventory_id = i.inventory_id
WHERE r.return_date IS NOT NULL
GROUP BY f.film_id
ORDER BY avg_rental_days DESC
LIMIT 10;
