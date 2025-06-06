
# in devlab0 directory execute:

make jm

# now copy and paste the below into the prompt of the jobmanager.

# Note the "-pyfs /pyapp/upper_udf.py" extra line that pulls in our dependency file.

******** Flatten Example  -> Out to fluss_catalog.fluss.factory_iot_unnested


/opt/flink/bin/flink run \
    -m jobmanager:8081 \
    -py /pyapp/flink_flat2.py \
    -pyfs /pyapp/upper_udf.py \
    --siteId 101 \
    --source factory_iot_north 

/opt/flink/bin/flink run \
    -m jobmanager:8081 \
    -py /pyapp/flink_flat2.py \
    -pyfs /pyapp/upper_udf.py \
    --siteId 102 \
    --source factory_iot_south

/opt/flink/bin/flink run \
    -m jobmanager:8081 \
    -py /pyapp/flink_flat2.py \
    -pyfs /pyapp/upper_udf.py \
    --siteId 103 \
    --source factory_iot_east