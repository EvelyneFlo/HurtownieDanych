with cte as(
	SELECT STRING_AGG(pt.ingredients,',') as ingredients
		,od.order_id
	FROM [cwiczenia1].[dbo].[pizzas] p

	JOIN order_details od on p.pizza_id = od.pizza_id
	JOIN pizza_types pt on pt.pizza_type_id = p.pizza_type_id
	JOIN orders o on o.order_id = od.order_id

	WHERE o.date LIKE '2015-03-%'
	
	GROUP BY od.order_id
)

SELECT order_id, ingredients
FROM cte
WHERE ingredients NOT LIKE '%Pineapple%'

