@echo off
setlocal enabledelayedexpansion

echo >>> Tạo thư mục jars...
if not exist jars mkdir jars

echo >>> Download các file JAR...
curl -L -o jars\aws-java-sdk-bundle-1.12.367.jar https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.12.367/aws-java-sdk-bundle-1.12.367.jar
curl -L -o jars\hadoop-aws-3.3.4.jar https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.3.4/hadoop-aws-3.3.4.jar
curl -L -o jars\postgresql-42.6.2.jar https://jdbc.postgresql.org/download/postgresql-42.6.2.jar

echo >>> Tạo thư mục minio-storage và pg-metastore-data...
if not exist minio-storage mkdir minio-storage
if not exist pg-metastore-data mkdir pg-metastore-data

echo >>> Docker build...
docker compose build

echo >>> Docker up...
docker compose up -d
