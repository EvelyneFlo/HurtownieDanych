with zadanie1 as (
SELECT od.[order_details_id]
	,od.[order_id]
	,od.[pizza_id]
	,od.[quantity]
	,p.price * od.quantity as summarized_price
	,o.date as order_date
FROM [cwiczenia1].[dbo].[order_details] od
JOIN pizzas p on od.pizza_id = p.pizza_id
JOIN orders o on o.order_id = od.order_id
WHERE o.date = '2015-02-18'
)



SELECT AVG(summarized_price) as mean_price, order_date
FROM zadanie1
GROUP BY order_date