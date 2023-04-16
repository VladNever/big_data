use yellow_taxi;
set hive.execution.engine=tez;

create view if not exists vw_report
(payment_type, dt, tips_average_amount, passengers_total)
AS
SELECT
     p.name payment_type
     , ft.dt dt
     , avg(ft.tip_amount) tips_average_amount
     , sum(ft.passenger_count) passengers_total
FROM dim_payment p
JOIN fct_trip ft ON ft.payment_type = p.id
WHERE date_format(ft.dt, 'yyyy') = '2020'
GROUP BY p.name, ft.dt
order by p.name, ft.dt;