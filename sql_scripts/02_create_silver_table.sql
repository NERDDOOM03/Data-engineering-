-- 02_create_silver_table.sql
CREATE SCHEMA IF NOT EXISTS SILVER;

CREATE OR REPLACE TABLE SILVER.stock_data_silver (
  timestamp     TIMESTAMP_NTZ,
  stock_symbol  STRING,
  price         FLOAT,
  volume        INT
);