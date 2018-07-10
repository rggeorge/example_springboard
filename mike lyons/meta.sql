SELECT DISTINCT name,
  VARIANCE(total_usage) OVER (PARTITION BY name ORDER BY name) as window_fn,
  PERCENTILE_CONT(total_usage, .9) OVER(PARTITION BY name) 
  /   PERCENTILE_CONT(total_usage, .1) OVER(PARTITION BY name) as pct_ratio
FROM 
  (SELECT year, name, sum(number) as total_usage
  FROM `bigquery-public-data.usa_names.usa_1910_current`
  GROUP BY 1, 2)
LIMIT 1000