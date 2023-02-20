/*
 * Use a JOIN to list the total paid by each customer.
 * List the customers alphabetically by last name.
 * Use tables payment and customer.
 */

WITH t1 AS(
    SELECT 
        cust.customer_id, cust.first_name, cust.last_name, pay.amount
    FROM customer cust
    JOIN payment pay
    ON cust.customer_id=pay.customer_id),

custid AS(
    SELECT
        customer_id, SUM(amount)
    FROM t1
    GROUP BY 1)

SELECT
    DISTINCT t1.customer_id, t1.first_name, t1.last_name, custid.sum
FROM t1
JOIN custid
USING(customer_id)
ORDER BY 3;
