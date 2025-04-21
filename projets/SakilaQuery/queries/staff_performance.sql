
SELECT
  s.first_name || ' ' || s.last_name AS staff_member,
  COUNT(p.payment_id) AS payments_handled,
  ROUND(SUM(p.amount), 2) AS total_revenue
FROM staff s
JOIN payment p ON s.staff_id = p.staff_id
GROUP BY s.staff_id
ORDER BY total_revenue DESC;
