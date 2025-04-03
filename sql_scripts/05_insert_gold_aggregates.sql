INSERT INTO DWH_GOLD.stock_data_gold (date, stock_symbol, avg_price, total_volume)
SELECT 
  CAST(timestamp AS DATE) AS date,
  stock_symbol,
  ROUND(AVG(price), 2) AS avg_price,
  SUM(volume) AS total_volume
FROM SILVER.stock_data_silver
WHERE volume != 0
GROUP BY CAST(timestamp AS DATE), stock_symbol
ORDER BY date;
