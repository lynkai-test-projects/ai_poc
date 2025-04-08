SELECT 
    part.product_category,
    COUNT(*) AS purchase_count
FROM line_item
LEFT JOIN order ON line_item.order_id = order.order_id
LEFT JOIN customer ON order.customer_id = customer.customer_id
LEFT JOIN part ON line_item.part_id = part.part_id
WHERE order.order_date >= customer.activation_date
  AND order.order_date < DATEADD(month, 1, customer.activation_date)
GROUP BY part.product_category
ORDER BY purchase_count DESC;