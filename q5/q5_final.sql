SELECT
    r.region_name AS region,
    c.customer_segment AS segment,
    AVG(CASE WHEN c.recent_adoption_flag = 1 THEN 1.0 ELSE 0.0 END) AS adoption_rate
FROM entity('customer') c
JOIN entity('nation') n
JOIN entity('region') r
GROUP BY r.region_name, c.customer_segment;