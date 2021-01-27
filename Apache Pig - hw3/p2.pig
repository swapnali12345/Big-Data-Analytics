lines = load 'eBooks/*.txt' as (line:chararray);
words = foreach lines generate FLATTEN(TOKENIZE(line)) as word;
grouped = group words by SIZE($0);
wordcount = foreach grouped generate group, COUNT(words);
dump wordcount;
