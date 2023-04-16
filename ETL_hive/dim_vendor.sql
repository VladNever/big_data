use yellow_taxi;
set hive.execution.engine=tez;

create external table if not exists dim_vendor
(
    id int,
    name string
)
stored as parquet
location 's3a://yellowtaxi/dim_vendor';

INSERT OVERWRITE table dim_vendor
select 1, 'Creative Mobile Technologies'
union all
select 2, 'VeriFone Inc';
