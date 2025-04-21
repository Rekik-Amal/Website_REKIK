
SELECT
  STRFTIME('%Y-%m', payment_date) AS month,
  ROUND(SUM(amount), 2) AS total_payments
FROM payment
GROUP BY month
ORDER BY month;
