# Apache Spark tutorials

PySpark notebooks to learn and start using Apache Spark are made available at [AstroLab Software/spark-tutorials](https://github.com/astrolabsoftware/spark-tutorials):

- Part I: Installation and first steps
- Part II: Spark SQL and DataFrames
- Part III: From Scala to Python
- Part IV: PySpark, Numpy, Pandas and co.
- Part V: Spark UI and debugging
- Part VI: Testing Spark applications
- Part VII: Interfacing with Spark
- Appendix A: Apache Spark @ NERSC
- Appendix B: Apache Spark @ DESC

They are intended to be ran on a laptop, a Spark cluster or at NERSC (JupyterLab).
The goal is to introduce few functionalities of interest (and by no means complete!).

For actual DESC contributions, see the [logbook](https://github.com/LSSTDESC/desc-spark/tree/master/logbook).

## Language

Spark provides many functionalities exposed through Scala/Python/Java/R API (Scala is the native one).
As far as DESC is concerned, I would advocate to use the Python API (called PySpark) for obvious reasons. But feel free to put your hands on Scala, it's worth it. For those interested, you can have a look at this [tutorial](https://gitlab.in2p3.fr/MaitresNageurs/QuatreNages/Scala) on Scala.

## Data Format

Most catalogs are stored in hdf5 files. As far as I know there is no complete PySpark connector on the market to read hdf5 into DataFrames. While writing a custom one belongs to the domain of the possible, I would rather advocate to focus first on existing tools which have been validated/tested.
FITS would be more appropriate as it has a Spark connector usable from all current API (see e.g. [spark-fits](https://github.com/astrolabsoftware/spark-fits)). Apache Parquet works as well since it has a built-in connector packaged and shipped with Apache Spark, and usable from all API (and super optimised and fast!).

## Infrastructure

CC-IN2P3 does not support Apache Spark yet.
NERSC does however (via shifter), and it works surprisingly very well.
We have a small dedicated Apache Spark cluster (on HDFS) at LAL, France for R&D, that can be used ([contact me](mailto:peloton@lal.in2p3.fr) if you are interested in using it).
