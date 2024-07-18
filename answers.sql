/* PROBLEM 1 */
SELECT email
FROM customers
ORDER BY email;

/* PROBLEM 2 */
SELECT id
FROM orders 
WHERE customer_id IN (
    SELECT id 
    FROM customers 
    WHERE fname = 'Elizabeth' AND lname = 'Crocker'
);

/* PROBLEM 3 */
SELECT SUM(num_cupcakes) 
FROM orders 
WHERE processed = FALSE;

/* PROBLEM 4 */
SELECT cupcakes.name, COALESCE(SUM(orders.num_cupcakes), 0) 
FROM cupcakes 
LEFT JOIN orders ON cupcakes.id = orders.cupcake_id 
GROUP BY cupcakes.name 
ORDER BY cupcakes.name;

/* PROBLEM 5 */
SELECT email, COALESCE(SUM(orders.num_cupcakes)) AS total
FROM customers 
LEFT JOIN orders ON customers.id = orders.customer_id 
GROUP BY email 
ORDER BY total DESC;

/* PROBLEM 6 */
SELECT DISTINCT fname, lname, email 
FROM customers 
JOIN orders ON customers.id = orders.customer_id 
JOIN cupcakes on orders.cupcake_id = cupcakes.id 
WHERE processed = TRUE AND cupcakes.name = 'funfetti';