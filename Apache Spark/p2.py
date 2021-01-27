from pyspark import SparkContext
sc = SparkContext("local")
lines = sc.textFile("file:///home/hadoop/eBooks/*")
words = lines.flatMap(lambda x:x.split())
print(words.map(len).map(lambda x:[x,1]).reduceByKey(lambda a,b: a+b).sortBy(lambda x:-x[1]).collect())
