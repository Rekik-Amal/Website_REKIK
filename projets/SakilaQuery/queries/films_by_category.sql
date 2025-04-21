
SELECT
  cat.name AS category,
  COUNT(fc.film_id) AS number_of_films
FROM category cat
JOIN film_category fc ON cat.category_id = fc.category_id
GROUP BY cat.category_id
ORDER BY number_of_films DESC;
