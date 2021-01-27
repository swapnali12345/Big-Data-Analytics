rows = load 'nyc1.csv' using PigStorage(',');
records = filter rows by $0 != 'vendor_id';
records1 = foreach records generate $3 as passenger_count, $4 as trip_distance, $12 as fare_amount, $15 as tip_amount;
dump records1;
fare_rate = foreach records1 generate $0 as passenger_count, ($2/$1) as fare_per_distance;
dump fare_rate;
grouped_rec = group records1 by passenger_count;
passenger_stats = foreach grouped_rec generate group, AVG(records1.trip_distance),AVG(records1.tip_amount);
dump passenger_stats;

