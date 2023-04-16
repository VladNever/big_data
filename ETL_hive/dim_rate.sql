use yellow_taxi;
set hive.execution.engine=tez;

create external table if not exists dim_rate
(
    id int,
    name string
)
stored as parquet
location 's3a://yellowtaxi/dim_rate';

INSERT OVERWRITE table dim_rate
select 1, 'Standard rate'
union all
select 2, 'JFK'
union all
select 3, 'Newark'
union all
select 4, 'Nassau or Westchester'
union all
select 5, 'Negotiated fare'
union all
select 6, 'Group ride';

