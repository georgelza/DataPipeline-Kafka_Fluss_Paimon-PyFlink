
SET 'sql-client.execution.result-mode' = 'tableau';
SET 'parallelism.default' = '2';
SET 'sql-client.verbose' = 'true';
SET 'execution.runtime-mode' = 'streaming';


-- Used as output table during our flink_avg1.py jobs

CREATE OR REPLACE TABLE fluss_catalog.fluss.factory_iot_stab (
     siteId             INTEGER
    ,deviceId           INTEGER
    ,sensorId           INTEGER
    ,partition_month    STRING
    ,stability_factor   DOUBLE
    ,measurement_count  BIGINT
    ,min_measurement    DOUBLE
    ,avg_measurement    DOUBLE
    ,max_measurement    DOUBLE
    ,window_start       TIMESTAMP_LTZ(3)
    ,window_end         TIMESTAMP_LTZ(3)
) PARTITIONED BY (partition_month) WITH (
     'bucket.num'                        = '3'
    ,'table.datalake.enabled'            = 'true'
    ,'table.auto-partition.time-unit'    = 'MONTH'
    ,'table.auto-partition.num-retention'= '60'
);


-- Add Partitions, 2022/06

ALTER TABLE fluss_catalog.fluss.factory_iot_stab ADD PARTITION (partition_month = '202205');
ALTER TABLE fluss_catalog.fluss.factory_iot_stab ADD PARTITION (partition_month = '202206');
ALTER TABLE fluss_catalog.fluss.factory_iot_stab ADD PARTITION (partition_month = '202207');
ALTER TABLE fluss_catalog.fluss.factory_iot_stab ADD PARTITION (partition_month = '202208');
ALTER TABLE fluss_catalog.fluss.factory_iot_stab ADD PARTITION (partition_month = '202209');
ALTER TABLE fluss_catalog.fluss.factory_iot_stab ADD PARTITION (partition_month = '202210');
ALTER TABLE fluss_catalog.fluss.factory_iot_stab ADD PARTITION (partition_month = '202211');
ALTER TABLE fluss_catalog.fluss.factory_iot_stab ADD PARTITION (partition_month = '202212');

ALTER TABLE fluss_catalog.fluss.factory_iot_stab ADD PARTITION (partition_month = '202301');
ALTER TABLE fluss_catalog.fluss.factory_iot_stab ADD PARTITION (partition_month = '202302');
ALTER TABLE fluss_catalog.fluss.factory_iot_stab ADD PARTITION (partition_month = '202303');
ALTER TABLE fluss_catalog.fluss.factory_iot_stab ADD PARTITION (partition_month = '202304');
ALTER TABLE fluss_catalog.fluss.factory_iot_stab ADD PARTITION (partition_month = '202305');
ALTER TABLE fluss_catalog.fluss.factory_iot_stab ADD PARTITION (partition_month = '202306');
ALTER TABLE fluss_catalog.fluss.factory_iot_stab ADD PARTITION (partition_month = '202307');
ALTER TABLE fluss_catalog.fluss.factory_iot_stab ADD PARTITION (partition_month = '202308');
ALTER TABLE fluss_catalog.fluss.factory_iot_stab ADD PARTITION (partition_month = '202309');
ALTER TABLE fluss_catalog.fluss.factory_iot_stab ADD PARTITION (partition_month = '202310');
ALTER TABLE fluss_catalog.fluss.factory_iot_stab ADD PARTITION (partition_month = '202311');
ALTER TABLE fluss_catalog.fluss.factory_iot_stab ADD PARTITION (partition_month = '202312');

ALTER TABLE fluss_catalog.fluss.factory_iot_stab ADD PARTITION (partition_month = '202401');
ALTER TABLE fluss_catalog.fluss.factory_iot_stab ADD PARTITION (partition_month = '202402');
ALTER TABLE fluss_catalog.fluss.factory_iot_stab ADD PARTITION (partition_month = '202403');
ALTER TABLE fluss_catalog.fluss.factory_iot_stab ADD PARTITION (partition_month = '202404');
ALTER TABLE fluss_catalog.fluss.factory_iot_stab ADD PARTITION (partition_month = '202405');
ALTER TABLE fluss_catalog.fluss.factory_iot_stab ADD PARTITION (partition_month = '202406');
ALTER TABLE fluss_catalog.fluss.factory_iot_stab ADD PARTITION (partition_month = '202407');
ALTER TABLE fluss_catalog.fluss.factory_iot_stab ADD PARTITION (partition_month = '202408');
ALTER TABLE fluss_catalog.fluss.factory_iot_stab ADD PARTITION (partition_month = '202509');
ALTER TABLE fluss_catalog.fluss.factory_iot_stab ADD PARTITION (partition_month = '202410');
ALTER TABLE fluss_catalog.fluss.factory_iot_stab ADD PARTITION (partition_month = '202411');
ALTER TABLE fluss_catalog.fluss.factory_iot_stab ADD PARTITION (partition_month = '202412');

ALTER TABLE fluss_catalog.fluss.factory_iot_stab ADD PARTITION (partition_month = '202501');
ALTER TABLE fluss_catalog.fluss.factory_iot_stab ADD PARTITION (partition_month = '202502');
ALTER TABLE fluss_catalog.fluss.factory_iot_stab ADD PARTITION (partition_month = '202503');
ALTER TABLE fluss_catalog.fluss.factory_iot_stab ADD PARTITION (partition_month = '202504');
ALTER TABLE fluss_catalog.fluss.factory_iot_stab ADD PARTITION (partition_month = '202505');
ALTER TABLE fluss_catalog.fluss.factory_iot_stab ADD PARTITION (partition_month = '202506');