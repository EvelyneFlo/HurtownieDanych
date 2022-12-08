--carriers statistics
SELECT cr.carrier_name
	, d.TheDate	
	, AVG(CAST(fs.amount AS DECIMAL(10,2))) as avg_amount
	, STDEV(CAST(fs.amount AS DECIMAL(10,2))) as std_amount
	, MIN(CAST(fs.amount AS DECIMAL(10,2))) as min_amount
	, MAX(CAST(fs.amount AS DECIMAL(10,2))) as max_amount
	, SUM(CAST(fs.amount AS DECIMAL(10,2))) as sum_amount
	, COUNT(fs.amount) as count_amount
FROM FactSales fs
JOIN Date d ON d.DateKey = fs.DateKey
JOIN Carrier cr ON cr.carrier_id = fs.CarrierKey
GROUP BY cr.carrier_name, d.TheDate
ORDER BY d.TheDate, cr.carrier_name