-- =====================================================
-- INIT DATABASES FOR HIVE METASTORE AND AIRFLOW (idempotent)
-- =====================================================

-- Create hive user if not exists
DO
$$
BEGIN
   IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'hive') THEN
      CREATE ROLE hive LOGIN PASSWORD 'hive';
   END IF;
END
$$;

---- Create metastore database if not exists
--      CREATE DATABASE metastore
--        WITH ENCODING='UTF8'
--        OWNER=hive
--        CONNECTION LIMIT=-1;


-- Create airflow database if not exists

      CREATE DATABASE airflow
        WITH ENCODING='UTF8'
        OWNER=hive
        CONNECTION LIMIT=-1;


-- Grant privileges
GRANT ALL PRIVILEGES ON DATABASE metastore TO hive;
GRANT ALL PRIVILEGES ON DATABASE airflow TO hive;
