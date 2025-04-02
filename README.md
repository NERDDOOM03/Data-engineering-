# Kafka Stock Market Data Engineering Project

This project simulates a full end-to-end real-time data pipeline using Kafka, Snowflake, S3 (LocalStack), and Airflow.

## Folder Structure

- `kafka_setup/`: Docker Compose setup for Kafka broker, Zookeeper.
- `scripts/`: Python scripts for producer, consumer, file storage, S3 upload.
- `data/`: JSON batches saved locally.
- `dags/`: Airflow DAGs (ETL orchestration).
- `snowflake_scripts/`: SQL scripts for schema/tables (bronze → silver → gold).
- `notes/`: Project notes and setup.

## Snowflake Layers

- **Bronze**: Raw ingested JSON from Kafka.
- **Silver**: Cleaned records (parsed, validated).
- **Gold (DWH)**: Aggregated KPIs like `avg_price`, `total_volume`.

---

## To Run

```bash
docker-compose -f kafka_setup/docker-compose.yml up
```

Then run the producer and consumer from `scripts/`.

---

## Author

NERDDOOM03