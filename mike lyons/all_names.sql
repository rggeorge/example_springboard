SELECT year, name, sum(number) as total_usage
FROM `bigquery-public-data.usa_names.usa_1910_current`
WHERE name IN ('Ryan', 'Nathan', 'Andrew', 'Elizabeth', 'Brenda', 'Steve', 'Randy', 'Greg', 'Terry', 'David')
GROUP BY 1, 2
-- LIMIT 100