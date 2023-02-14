/*
 * Use a JOIN to display the total amount rung up by each staff member in January of 2020.
 * Use tables staff and payment.
 */

SELECT
    stf.first_name, stf.last_name, ROUND(SUM(pay.amount),2) AS "sum"
FROM staff stf
LEFT JOIN payment pay
ON stf.staff_id = pay.staff_id
WHERE pay.payment_date >= '2020-01-01' AND pay.payment_date < '2020-02-01'
GROUP BY (stf.first_name, stf.last_name);
