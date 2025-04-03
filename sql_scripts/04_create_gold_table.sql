CREATE SCHEMA IF NOT EXISTS DWH_GOLD;

CREATE OR REPLACE TABLE DWH_GOLD.stock_data_gold (
  id            NUMBER AUTOINCREMENT PRIMARY KEY,
  date          DATE,
  stock_symbol  STRING,
  avg_price     FLOAT,
  total_volume  NUMBER
);