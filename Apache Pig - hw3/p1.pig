lines = load 'eBooks/*.txt' as (line:chararray);
words = foreach lines generate FLATTEN(TOKENIZE(line)) as word;
grouped = group words by word;
wordcount = foreach grouped generate group, COUNT(words);
filtered = FILTER wordcount by $1 >= 50000;
ordered_records = ORDER filtered BY $1 DESC;
dump ordered_records;
