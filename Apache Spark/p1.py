from pyspark import SparkContext
sc = SparkContext("local")
lines = sc.textFile("file:///home/hadoop/eBooks/*")  
words = lines.flatMap(lambda x:x.split())  
print(words.map(lambda x:[x,1]).reduceByKey(lambda a,b: a+b).filter(lambda x:x[1]>=50000).sortBy(lambda x:-x[1]).collect())
