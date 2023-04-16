use yellow_taxi;
set hive.execution.engine=tez;

INSERT OVERWRITE table mrt_report select * from vw_report;
