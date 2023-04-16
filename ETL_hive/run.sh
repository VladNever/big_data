hive -e "create database if not exists yellow_taxi location 's3a://yellowtaxi/';"

hive --database yellow_taxi -f /tmp/hm2/dim_vendor.sql
hive --database yellow_taxi -f /tmp/hm2/dim_rate.sql
hive --database yellow_taxi -f /tmp/hm2/dim_payment.sql
hive --database yellow_taxi -f /tmp/hm2/fct_trip.sql
hive --database yellow_taxi -f /tmp/hm2/insrt_fct_trip.sql
hive --database yellow_taxi -f /tmp/hm2/vw_report.sql
hive --database yellow_taxi -f /tmp/hm2/mrt_report.sql
hive --database yellow_taxi -f /tmp/hm2/insrt_mrt_report.sql

