
SELECT
  r.rental_id,
  r.customer_id,
  CASE WHEN p.payment_id IS NOT NULL THEN 'Paid' ELSE 'Unpaid' END AS payment_status
FROM rental r
LEFT JOIN payment p ON r.rental_id = p.rental_id;
