SELECT name, year, total_usage, peak_min, prev_max, post_max,
  peak_min > prev_max AND   peak_min > post_max AS is_peak
FROM (
  SELECT DISTINCT name, year, total_usage,
    MIN(total_usage) OVER (PARTITION BY name ORDER BY year ROWS BETWEEN 3 PRECEDING AND 3 FOLLOWING) as peak_min,
    MAX(total_usage) OVER (PARTITION BY name ORDER BY year ROWS BETWEEN 8 PRECEDING AND 4 PRECEDING) as prev_max,
    MAX(total_usage) OVER (PARTITION BY name ORDER BY year ROWS BETWEEN 4 FOLLOWING AND 8 FOLLOWING) as post_max
  FROM 
    (SELECT year, name, sum(number) as total_usage
    FROM `bigquery-public-data.usa_names.usa_1910_current`
    WHERE name IN ('Ryan', 'Nathan', 'Andrew', 'Elizabeth', 'Brenda', 'Steve', 'Randy', 'Greg', 'Terry', 'David')
    GROUP BY 1, 2)
  ORDER BY name, year
 )