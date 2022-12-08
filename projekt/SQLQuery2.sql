-- selecting 3 customers by each month who have the highest amount 
SELECT *
FROM
  (SELECT fs.customersKey
		, c.first_name
		, c.last_name 
		, d.TheDate as date
		, d.TheMonth as month
		, d.TheYear as year
		, fs.amount
        , RANK() OVER (PARTITION BY d.TheMonth, d.TheYear ORDER BY CAST(fs.amount as decimal(10,2)) DESC) AS pos
     FROM factsales fs
	 JOIN Customers c ON c.id = fs.customersKey
	 JOIN Date d ON d.DateKey = fs.dateKey
	 ) AS ss

WHERE pos < 4
ORDER BY year, month