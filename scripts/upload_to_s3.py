import boto3
import os

bucket_name = "kafka-stock-json-batches"
local_dir = "data/consumed_batches"
s3_prefix = "bronze/"

s3 = boto3.client("s3")

for filename in os.listdir(local_dir):
    if filename.endswith(".json"):
        local_path = os.path.join(local_dir, filename)
        s3_key = f"{s3_prefix}{filename}"
        s3.upload_file(local_path, bucket_name, s3_key)
        print(f"Uploaded {filename} to s3://{bucket_name}/{s3_key}")
