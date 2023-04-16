use yellow_taxi;
set hive.execution.engine=tez;

create external table if not exists mrt_report
(
    payment_type string,
    dt date,
    tips_average_amount double,
    passengers_total double
)
stored as parquet
location 's3a://yellowtaxi/mrt_report';
