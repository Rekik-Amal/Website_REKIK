
WITH monthly_performance AS (
  SELECT
    STRFTIME('%Y-%m', p.payment_date) AS month,
    s.staff_id,
    s.first_name || ' ' || s.last_name AS employee,
    SUM(p.amount) AS total_revenue
  FROM payment p
  JOIN staff s ON s.staff_id = p.staff_id
  GROUP BY month, s.staff_id
)
SELECT *
FROM (
  SELECT *,
         RANK() OVER (PARTITION BY month ORDER BY total_revenue DESC) AS monthly_rank
  FROM monthly_performance
)
WHERE monthly_rank = 1
ORDER BY month;
