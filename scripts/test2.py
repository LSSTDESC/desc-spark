from pyspark.sql import SparkSession

from pyspark.sql.functions import pandas_udf, PandasUDFType
import numpy as np
import pandas as pd

@pandas_udf('float', PandasUDFType.GROUPED_AGG)  # doctest: +SKIP
def median_udf(v):
    return np.median(v)

spark = SparkSession.builder.getOrCreate()

df1 = spark.createDataFrame([[1.0, 2, 3]], ["col0", "col1", "col2"])
df2 = spark.createDataFrame([[1.0, 2, 6]], ["col0", "col1", "col2"])
df3 = spark.createDataFrame([[1.0, 3, 7]], ["col0", "col1", "col2"])
df=df1.unionByName(df2).unionByName(df3)
df.show()

df.groupby('col0').agg(median_udf('col2')).show()
df.show()
