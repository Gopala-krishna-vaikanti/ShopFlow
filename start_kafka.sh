#!/bin/bash

# Start our one-node kafka [Kraft] in the background and wait until it answers.
cd "$(dirname "$0")" # Change to the script's directory so we can run it from anywhere.

if [ ! -d kafka-data ]; then
  echo "Creating kafka-data directory..."
  new_kafka/bin/kafka-storage.sh format --standalone -c kafka.properties \
  -t $(new_kafka/bin/kafka-storage.sh random-uuid)
fi


# give java a bit more memory [512 MB] to avoid OOM errors when running the tests
export KAFKA_HEAP_OPTS="-Xmx512m -Xms512m"

new_kafka/bin/kafka-server-start.sh -daemon kafka.properties

until new_kafka/bin/kafka-broker-api-versions.sh --bootstrap-server localhost:9092 \
  > /dev/null 2>&1; do sleep 1; done

echo "Kafka is up and running on localhost:9092"
