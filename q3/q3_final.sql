SELECT 
    ROUND(AVG(
        CASE 
            WHEN c.second_order_date IS NOT NULL 
                 AND DATEDIFF(day, c.first_order_date, c.second_order_date) <= 30 
            THEN 1.0 
            ELSE 0 
        END
    ) * 100, 2) AS conversion_percentage
FROM 
    entity('customer') c
WHERE 
    c.first_order_date IS NOT NULL;