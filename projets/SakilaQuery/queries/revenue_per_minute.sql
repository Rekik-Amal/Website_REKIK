
SELECT
  f.title,
  f.length,
  SUM(p.amount) AS total_revenue,
  ROUND(SUM(p.amount) / f.length, 2) AS revenue_per_minute
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON r.inventory_id = i.inventory_id
JOIN payment p ON p.rental_id = r.rental_id
WHERE f.length > 0
GROUP BY f.film_id
ORDER BY revenue_per_minute DESC
LIMIT 10;
