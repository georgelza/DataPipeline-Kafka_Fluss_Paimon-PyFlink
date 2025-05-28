
# Data Flows

1. 1.0.creCat.sql

  Will create:

    - hive_catalog
    - iot database inside hive_catalog
    - fluss_catalog

1. 2.0.creKafkaSource.sql

    - Create 3 Flink tables, sourced using kafka connector from 3 x source topics.

2.  2.1.creFlussTargets.sql

    - Create a single Fluss table, to contain all the unnested data, `factory_iot_unnested` catalogged in `fluss_catalog.fluss`.
  
3.  2.2.creFlussTargets.sql

    - Create a single Fluss table, to contain all the aggregated (min, avg, max and count) per per site, per device, per sensor, per minute data, `factory_iot_avg` catalogged in `fluss_catalog.fluss`.


## Misc Fluss SQL/Partitioning examples 

### Primary key and log based tables, manual and auto partitioned. 

    - re Primary Key and Log based tables, partitioned and not, using auto or manual partition adding.
    - The Partitioned by (<VALUE>) must be a STRING.
    - The <VALUE> can also not be calculated as part of the create table, hint, calculate the value in the insert statement.
  
-- Basic PK Table
```sql
  CREATE TABLE my_pk_table (
    shop_id BIGINT,
    user_id BIGINT,
    num_orders INT,
    total_amount INT,
    PRIMARY KEY (shop_id, user_id) NOT ENFORCED
  ) WITH (
    'bucket.num' = '4'
  );

  -- Partitioned PK Table
  CREATE TABLE my_part_pk_table (
    dt STRING,
    shop_id BIGINT,
    user_id BIGINT,
    num_orders INT,
    total_amount INT,
    PRIMARY KEY (dt, shop_id, user_id) NOT ENFORCED
  ) PARTITIONED BY (dt);

  -- Add Partitions, or
  ALTER TABLE my_part_pk_table ADD PARTITION (dt = '2025-03-05');

  -- or
  ALTER TABLE my_part_pk_table ADD PARTITION (dt = '20250305');  -- if format = yyyyMMdd


  -- Auto Partitioned PK Table
  CREATE TABLE my_auto_part_pk_table (
    dt STRING,
    shop_id BIGINT,
    user_id BIGINT,
    num_orders INT,
    total_amount INT,
    PRIMARY KEY (dt, shop_id, user_id) NOT ENFORCED
  ) PARTITIONED BY (dt) WITH (
    'bucket.num' = '4',
    'table.auto-partition.enabled' = 'true',
    'table.auto-partition.time-unit' = 'day'
  );

  -- Basic Log Table
  CREATE TABLE my_log_table (
    order_id BIGINT,
    item_id BIGINT,
    amount INT,
    address STRING
  ) WITH (
    'bucket.num' = '8'
  );

  -- Partitioned Log table
  CREATE TABLE my_part_log_table (
    order_id BIGINT,
    item_id BIGINT,
    amount INT,
    address STRING,
    dt STRING
  ) PARTITIONED BY (dt);

  -- Add Partitions, or
  ALTER TABLE my_part_log_table ADD PARTITION (dt = '2025-03-05');

  -- Auto Partitioned Log Table
  CREATE TABLE my_auto_part_log_table (
    order_id BIGINT,
    item_id BIGINT,
    amount INT,
    address STRING,
    dt STRING
  ) PARTITIONED BY (dt) WITH (
    'bucket.num' = '8',
    'table.auto-partition.enabled' = 'true',
    'table.auto-partition.time-unit' = 'hour'
  );

  -- Show/Display partitions for a table
  SHOW PARTITIONS my_part_pk_table;
  SHOW PARTITIONS my_auto_part_pk_table;
  SHOW PARTITIONS my_part_log_table;
  SHOW PARTITIONS my_auto_part_log_table;


  -- to pipeline the data to lakehouse add the following to the create table.ABORT
  'table.datalake.enabled' = 'true'
```
