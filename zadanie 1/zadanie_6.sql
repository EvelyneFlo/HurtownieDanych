SELECT pt.name
	,pt.category
	,COUNT(category) as pizzas_sold_no
FROM pizzas p

JOIN pizza_types pt ON pt.pizza_type_id = p.pizza_type_id
JOIN order_details od ON od.pizza_id = p.pizza_id
JOIN orders o ON o.order_id = od.order_id

WHERE MONTH(o.date) = '1'

GROUP BY p.pizza_type_id, pt.name, pt.category

