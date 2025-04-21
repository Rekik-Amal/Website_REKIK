
SELECT
  c.name AS category,
  ROUND(AVG(JULIANDAY(r.return_date) - JULIANDAY(r.rental_date)), 2) AS avg_days
FROM category c
JOIN film_category fc ON fc.category_id = c.category_id
JOIN film f ON f.film_id = fc.film_id
JOIN inventory i ON i.film_id = f.film_id
JOIN rental r ON r.inventory_id = i.inventory_id
WHERE r.return_date IS NOT NULL
GROUP BY c.category_id
ORDER BY avg_days DESC;
