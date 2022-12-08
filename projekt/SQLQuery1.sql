-- selecting about 100 people who pay the most

with cte as (
	SELECT fs.customersKey
		, c.first_name
	    , c.last_name
		, d.TheDate as date
		, fs.amount
		, RANK () OVER(
			ORDER BY CAST(amount as decimal(10,2)) DESC
		) AS rank
	FROM FactSales fs
	JOIN Customers c ON c.id = fs.customersKey
	JOIN Date d ON d.DateKey = fs.DateKey
)

SELECT * FROM cte
WHERE rank < 100