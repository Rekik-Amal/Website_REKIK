
SELECT title, length
FROM film
WHERE length > (
  SELECT AVG(length)
  FROM film
)
ORDER BY length DESC;
