create table if not exists nyc
(vendor_id string,pickup_datetime string,dropoff_datetime string,passenger_count int,trip_distance double,pickup_longitude double,pickup_latitude double,rate_code int,store_and_fwd_flag string,dropoff_longitude double ,dropoff_latitude double,payment_type string,fare_amount double,surcharge double,mta_tax double,tip_amount double,tolls_amount double,total_amount double)
row format delimited
fields terminated by ','
stored as textfile
tblproperties('skip.header.line.count'='1');
load data local inpath 'nyc_taxi_data_2014.csv' overwrite into table nyc;
create view nyc2 as select passenger_count, trip_distance, fare_amount, (tip_amount/total_amount) as tip_rate from nyc where passenger_count between 1 and 9; 
select passenger_count, count(*), avg(trip_distance),avg(fare_amount), avg(tip_rate) from nyc2 group by passenger_count order by passenger_count;
