SELECT p.size
	,COUNT(od.order_id) as count

FROM pizzas p

LEFT JOIN order_details od ON od.pizza_id = p.pizza_id
LEFT JOIN orders o ON o.order_id = od.order_id

WHERE MONTH(o.date) = '2' OR MONTH(o.date) = '3'

GROUP BY size
