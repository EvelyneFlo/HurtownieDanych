SELECT COUNT(order_id) as order_count, date, left(time,2) as hour 
FROM orders
WHERE date = '2015-01-01'
GROUP BY left(time,2), date