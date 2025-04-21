
SELECT
  f.title AS film_title,
  COUNT(r.rental_id) AS times_rented
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON r.inventory_id = i.inventory_id
GROUP BY f.film_id
ORDER BY times_rented DESC
LIMIT 10;
