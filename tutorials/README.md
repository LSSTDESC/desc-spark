# Apache Spark tutorials

You will find (py)spark notebooks to start using Apache Spark. They are intented to be ran on a laptop or at NERSC (JupyterLab) when data access is needed. The goal is to introduce few functionalities of interest (and by no means complete!). Currently available:

- Apache Spark for beginners.
- Spark SQL and DataFrames: A tour of data format.
- Data manipulation: functional programing & distributed computing.
- Towards DESC DC2 analysis.

For actual DESC contribution, see the [logbook]().

## Language

Spark provides many functionalities exposed through Scala/Python/Java/R API (Scala is the native one).
As far as DESC is concerned, I would advocate to use the Python API (called pyspark) for obvious reasons. But feel free to put your hands on Scala, it's worth it. For those interested, you can have a look at this [tutorial](https://gitlab.in2p3.fr/MaitresNageurs/QuatreNages/Scala) on Scala.

## Data Format

Most catalogs are stored in hdf5 files. As far as I know there is no serious pyspark connector on the market to read hdf5 into DataFrames. While writing a custom one belongs to the domain of the possible, I would rather advocate to focus first on existing tools which have been validated/tested.
FITS would be more appropriate as it has a Spark connector usable from all current API (see e.g. [spark-fits](https://github.com/astrolabsoftware/spark-fits)). Apache Parquet works as well since it has a built-in connector packaged and shipped with Apache Spark, and usable from all API.

## Infrastructure

CC-IN2P3 does not support Apache Spark yet.
NERSC does however (via shifter), and it works surprisingly well.
We have a small dedicated Apache Spark cluster (on HDFS) at LAL, France for R&D, that can be used ([contact me](mailto:peloton@lal.in2p3.fr) if you are interested in using it).
