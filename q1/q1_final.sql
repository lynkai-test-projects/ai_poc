SELECT 
    p.type as product_category,
    COUNT(*) AS purchase_count
FROM entity('line_item') li
JOIN entity('order') o
JOIN entity('customer') c
JOIN entity('part') p
WHERE o.order_date >= c.first_ever_order_date
  AND o.order_date < DATEADD(month, 1, c.first_ever_order_date)
GROUP BY p.type
ORDER BY purchase_count DESC;