rows = load 'nyc_taxi_data_2014.csv' using PigStorage(',');
records = filter rows by $0 != 'vendor_id';
records2 = foreach records generate $3 as passenger_count, $4 as trip_distance, $12 as fare_amount,($15/$17) as tip_rate;
records3 = filter records2 by (passenger_count >0) AND (passenger_count<10);
group_passengers = group records3 by passenger_count;
final_result = foreach group_passengers generate group, AVG(records3.trip_distance), AVG(records3.fare_amount),AVG(records3.tip_rate);
DUMP final_result;