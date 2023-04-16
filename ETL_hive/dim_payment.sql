use yellow_taxi;
set hive.execution.engine=tez;

create external table if not exists dim_payment
(
    id int,
    name string
)
stored as parquet
location 's3a://yellowtaxi/dim_payment';

INSERT OVERWRITE table dim_payment
select 1, 'Credit card'
union all
select 2, 'Cash'
union all
select 3, 'No charge'
union all
select 4, 'Dispute'
union all
select 5, 'Unknown'
union all
select 6, 'Voided trip'

