create table if not exists lines (line string);
load data local inpath 'eBooks/*.txt' overwrite into table lines;
create view if not exists words as select explode(split(line,' ')) as word from lines;
select word, count(*) as cnt from words group by word having count(*) >= 50000 order by cnt desc;