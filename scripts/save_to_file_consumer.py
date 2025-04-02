from kafka import KafkaConsumer
from json import loads, dump
from datetime import datetime
import os
output_dir = "./output_dir"

consumer = KafkaConsumer(
    'stock_topic',
    bootstrap_servers=['localhost:9092'],
    auto_offset_reset='earliest',
    value_deserializer=lambda x: loads(x.decode('utf-8'))
)

# Create folder if it doesn't exist
output_dir = 'data/consumed_batches'
os.makedirs(output_dir, exist_ok=True)

# Batch processing
batch_size = 1000
batch = []
for message in consumer:
    batch.append(message.value)

    if len(batch) == batch_size:
        timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
        filename = f"{output_dir}/batch_{timestamp}.json"
        with open(filename, 'w') as f:
            dump(batch, f, indent=2)
        print(f"Saved batch to {filename}")
        batch = []
