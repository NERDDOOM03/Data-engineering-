import pandas as pd
from time import sleep
from json import dumps
from kafka import KafkaProducer

# Load dataset
df = pd.read_csv('data/indexProcessed.csv')


# Set up Kafka producer
producer = KafkaProducer(
    bootstrap_servers=['localhost:9092'],
    value_serializer=lambda x: dumps(x).encode('utf-8')
)

# Send each row as a message
for i, row in df.iterrows():
    data = row.to_dict()
    producer.send('stock_topic', value=data)
    print(f"Sent: {data}")
    sleep(1)
print(f"Total rows sent: {i + 1}")
