SELECT
    region.region_name AS region,
    customer.customer_segment AS segment,
    AVG(CASE WHEN customer.recent_adoption_flag = 1 THEN 1.0 ELSE 0.0 END) AS adoption_rate
FROM customer
LEFT JOIN nation ON customer.nation_id = nation.nation_id
LEFT JOIN region ON nation.region_id = region.region_id
GROUP BY region.region_name, customer.customer_segment;