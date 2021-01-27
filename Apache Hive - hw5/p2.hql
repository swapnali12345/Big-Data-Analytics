create table if not exists lines2 (line string);
load data local inpath 'eBooks/*.txt' overwrite into table lines2;
create view if not exists words2 as select explode(split(line,' ')) as word from lines2;
select length(word), count(*) as cnt from words2 group by length(word) order by cnt desc;