FROM openjdk:11-jre

WORKDIR /opt/dynamodb

# Download DynamoDB Local
RUN wget -O /opt/dynamodb/dynamodb_local_latest https://s3.us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_latest.tar.gz || (echo "Download failed"; exit 1)

# Extract the downloaded file (assuming it's a tar.gz file)
RUN tar -xzf /opt/dynamodb/dynamodb_local_latest -C /opt/dynamodb

VOLUME ["/var/lib/dynamodb"]

EXPOSE 4761

CMD ["java", "-Djava.library.path=./DynamoDBLocal_lib", "-jar", "DynamoDBLocal.jar", "-dbPath", "/var/lib/dynamodb", "-port", "4761"]
