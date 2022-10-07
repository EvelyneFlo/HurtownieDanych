with all_orders as(
	SELECT o.order_id
		,o.date
		,SUM(p.price*od.quantity) as order_amount
	FROM orders o

	JOIN order_details od ON od.order_id = o.order_id
	JOIN pizzas p ON p.pizza_id = od.pizza_id

	GROUP BY o.date, o.order_id
),

groupby_orders as(
	SELECT AVG(order_amount) as average_month_amount, MONTH(date) as md
	FROM all_orders
	GROUP BY MONTH(date) 
)

SELECT 
	a.order_id,
	a.order_amount,
	g.average_month_amount,
	a.date
FROM all_orders a

LEFT JOIN groupby_orders g ON g.md = MONTH(a.date) 