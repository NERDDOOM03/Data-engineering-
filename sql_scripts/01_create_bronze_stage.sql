-- 01_create_bronze_stage.sql
CREATE OR REPLACE FILE FORMAT json_format TYPE = 'JSON';

CREATE OR REPLACE STORAGE INTEGRATION s3_int_kafka_batch
TYPE = EXTERNAL_STAGE
STORAGE_PROVIDER = S3
ENABLED = TRUE
STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::821619202551:role/SnowflakeS3AccessRole'
STORAGE_ALLOWED_LOCATIONS = ('s3://kafka-stock-json-batches/bronze/');

CREATE OR REPLACE STAGE kafka_stage_bronze
  URL = 's3://kafka-stock-json-batches/bronze/'
  STORAGE_INTEGRATION = s3_int_kafka_batch
  FILE_FORMAT = json_format;