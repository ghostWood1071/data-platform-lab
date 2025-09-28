# Data Platform Deployment (MinIO, PostgreSQL, Hive, Trino, Spark, Airflow)



## 📌 Services trong hệ thống

| Service              | Mô tả                                                                 |
|----------------------|----------------------------------------------------------------------|
| **minio**            | Object storage S3-compatible, dùng để lưu trữ dữ liệu thô và bảng Iceberg. |
| **pg-metastore**     | PostgreSQL database, dùng làm **metastore** cho Hive và Airflow.         |
| **hive-metastore**   | Quản lý metadata bảng Hive/Iceberg, kết nối tới PostgreSQL.             |
| **hiveserver2**      | Cho phép client (JDBC/ODBC) kết nối để query dữ liệu Hive.              |
| **trino-coordinator**| Trino coordinator, điều phối query phân tán.                           |
| **trino-worker**     | Trino worker node, thực thi query.                                     |
| **spark-master**     | Spark master node, điều phối job ETL.                                   |
| **spark-worker**     | Spark worker node, thực thi task Spark từ master.                      |
| **airflow-scheduler**| Airflow scheduler, quản lý và chạy DAGs (workflow).                   |
| **airflow-webserver**| Giao diện web quản lý Airflow DAGs, logs.                             |
| **airflow-init**     | Service khởi tạo Airflow (db init, tạo user admin).                   |

---

## ⚙️ Hướng dẫn setup
Linux
bash setup.sh

Windows
setup.cmd


📌 Các script setup.sh và setup.cmd đã bao gồm toàn bộ các bước:

Tạo thư mục cần thiết (jars/, minio-storage/, pg-metastore-data/)

Download các file JAR cần thiết

Build docker images

Khởi chạy cluster bằng docker compose up -d

## 📂 Cấu trúc thư mục sau khi setup

```bash
project-root/
│── docker-compose.yml
│── README.md
│── setup.sh            # Script cho Linux
│── setup.cmd           # Script cho Windows
│
├── jars/               # Chứa các JAR cần thiết
│   ├── aws-java-sdk-bundle-1.12.367.jar
│   ├── hadoop-aws-3.3.4.jar
│   └── postgresql-42.6.2.jar
│
├── minio-storage/      # Dữ liệu MinIO
└── pg-metastore-data/  # Dữ liệu PostgreSQL

