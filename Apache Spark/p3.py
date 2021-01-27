from pyspark import SparkContext
sc = SparkContext("local")
lines = sc.textFile("file:///mnt/nyc_taxi_data_2014.csv")
rows = lines.map(lambda x:x.split(',')).filter(lambda x:len(x)>17 and x[1]!='pickup_datetime')
nyc2 = rows.map(lambda x:[eval(x[3]),eval(x[4]),eval(x[12]),eval(x[15])/eval(x[17])]).filter(lambda x:x[0]>=1 and x[0]<=9)
nyc3 = nyc2.map(lambda x: (x[0],[1] + x[1:])).reduceByKey(lambda a,b:(a[0]+b[0],(a[0]*a[1]+b[0]*b[1])/(a[0]+b[0]),(a[0]*a[2]+b[0]*b[2])/(a[0]+b[0]),(a[0]*a[3]+b[0]*b[3])/(a[0]+b[0]))).sortBy(lambda x:x[0])
print(nyc3.collect())














