# Source me in every terminal: source env.sh
export PATH="$PWD/new_kafka/bin:$PATH"
export BS=localhost:9092
export KAFKA_LOG4J_OPTS="-Dlog4j2.configurationFile=file:///D:/shopflow/new_kafka/config/tools-log4j2.yaml"