use yellow_taxi;
set hive.execution.engine=tez;

create external table if not exists fct_trip
(
vendor_id string,
tpep_pickup_datetime timestamp,
tpep_dropoff_datetime timestamp,
passenger_count int,
trip_distance double,
ratecode_id int,
store_and_fwd_flag string,
pulocation_id int,
dolocation_id int,
payment_type int,
fare_amount double,
extra double,
mta_tax double,
tip_amount double,
tolls_amount double,
improvement_surcharge double,
total_amount double,
congestion_surcharge double
)
partitioned by (dt date)
stored as parquet
location 's3a://yellowtaxi/fct_trip';

create external table if not exists data_trip
(
vendor_id string,
tpep_pickup_datetime timestamp,
tpep_dropoff_datetime timestamp,
passenger_count int,
trip_distance double,
ratecode_id int,
store_and_fwd_flag string,
pulocation_id int,
dolocation_id int,
payment_type int,
fare_amount double,
extra double,
mta_tax double,
tip_amount double,
tolls_amount double,
improvement_surcharge double,
total_amount double,
congestion_surcharge double
)
row format delimited
    fields terminated by ','
    lines terminated by '\n'
location 's3a://yellowtaxi/2020'
TBLPROPERTIES ("skip.header.line.count"="1");


-- set hive.execution.engine=tez;
-- SET hive.exec.max.dynamic.partitions=1000;
-- SET hive.exec.max.dynamic.partitions.pernode=1000;
SET hive.exec.dynamic.partition=true;
SET hive.exec.dynamic.partition.mode=nonstrict;
insert overwrite table fct_trip PARTITION(dt)
select vendor_id, tpep_pickup_datetime, tpep_dropoff_datetime, passenger_count,
       trip_distance, ratecode_id, store_and_fwd_flag, pulocation_id, dolocation_id, payment_type,
       fare_amount, extra, mta_tax, tip_amount, tolls_amount, improvement_surcharge, total_amount,
       congestion_surcharge, to_date(tpep_pickup_datetime) as dt
from data_trip;