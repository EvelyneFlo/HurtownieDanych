

with total_price_table as(
	SELECT od.order_id
		,p.price * od.quantity as total_price
		,o.date as order_date
	FROM order_details od

	JOIN orders o ON od.order_id = o.order_id
	JOIN pizzas p ON od.pizza_id = p.pizza_id
),

ranking as(
SELECT p.order_id,p.total_price, p.rank_no, p.order_date
    FROM (
        SELECT order_id,total_price, order_date, Rank() 
          over (Partition BY MONTH(order_date)
                ORDER BY total_price DESC ) AS rank_no
        FROM total_price_table
        ) p WHERE rank_no <= 10
)

SELECT * FROM ranking
WHERE MONTH(order_date) = '2'
