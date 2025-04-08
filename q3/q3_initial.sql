SELECT 
    ROUND(AVG(
        CASE 
            WHEN customer.second_order_date IS NOT NULL 
                 AND DATEDIFF(day, customer.first_order_date, customer.second_order_date) <= 30 
            THEN 1.0 
            ELSE 0 
        END
    ) * 100, 2) AS conversion_percentage
FROM 
    "customer"
WHERE 
    customer.first_order_date IS NOT NULL;