INSERT INTO SILVER.stock_data_silver
SELECT 
  TO_TIMESTAMP_NTZ(value:"Date"::STRING) AS timestamp,
  value:"Index"::STRING AS stock_symbol,
  ROUND(value:"Close"::FLOAT, 2) AS price,
  value:"Volume"::INT AS volume
FROM @KAFKA_PROJECT.PUBLIC.kafka_stage_bronze (FILE_FORMAT => json_format),
  LATERAL FLATTEN(INPUT => $1)
WHERE value:"Index" IS NOT NULL AND value:"Close" IS NOT NULL;