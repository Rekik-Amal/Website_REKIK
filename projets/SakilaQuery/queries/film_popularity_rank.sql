
WITH film_rental_counts AS (
  SELECT
    f.film_id,
    f.title,
    COUNT(r.rental_id) AS rental_count
  FROM film f
  JOIN inventory i ON f.film_id = i.film_id
  JOIN rental r ON r.inventory_id = i.inventory_id
  GROUP BY f.film_id
)
SELECT
  title,
  rental_count,
  RANK() OVER (ORDER BY rental_count DESC) AS popularity_rank
FROM film_rental_counts
ORDER BY popularity_rank
LIMIT 20;
