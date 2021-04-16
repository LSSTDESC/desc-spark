
from pyspark.sql import SparkSession
from pyspark.sql.functions import pandas_udf, PandasUDFType
import numpy as np
import pandas as pd
import healpy as hp

nside=256
nest=False
@pandas_udf('long', PandasUDFType.SCALAR)
def Ang2Pix(ra,dec):
    return pd.Series(hp.ang2pix(nside,np.radians(90-dec),np.radians(ra),nest=nest))

spark = SparkSession.builder.getOrCreate()
df = spark.createDataFrame([[10.0, 20]], ["ra", "dec"])
df=df.withColumn("ipix",Ang2Pix("ra","dec"))
df.show()
