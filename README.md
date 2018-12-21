# Apache Spark @ DESC

This repository provides:

- How to set up a DESC python environment with Apache Spark at NERSC (batch/interactive + JupyterLab).
- Basic tutorials to discover Apache Spark.
- Links to Apache Spark developments in DESC (DC2 data access, 3x2pt, ...).

To come:

- Stack environment + Apache Spark.
- Bootcamp for DESC members.

## Apache Spark

[Apache Spark](http://spark.apache.org/) is a cluster computing framework, that is a set of tools to perform computation on a network of many machines. Spark started in 2009 as a research project, and it had a huge success so far in the industry. It is based on the so-called MapReduce cluster computing paradigm, popularized by the Hadoop framework using implicit data parallelism and fault tolerance.

Spark provides many functionalities exposed through Scala/Python/Java/R API (Scala is the native one). As far as DESC is concerned, I would advocate to use the Python API (called pyspark) for obvious reasons. But feel free to put your hands on Scala, it's worth it.

## Working at NERSC (JupyterLab)

We provide a kernel to work with Apache Spark and DESC shipped with your DESC
environment (see [LSSTDESC/nersc](https://github.com/LSSTDESC/nersc)). You just need to select the `desc-pyspark` kernel in the JupyterLab interface. Note that this kernel is automatically installed in your environment when you use the kernel setup script:

```bash
source /global/common/software/lsst/common/miniconda/kernels/setup.sh
```

## Working at NERSC (batch mode)

NERSC provides support to run Spark at scale. Note that for Spark version 2.3.0+, Spark runs inside of [Shifter](https://www.nersc.gov/research-and-development/user-defined-images/). Complete information is available [here](https://www.nersc.gov/users/data-analytics/data-analytics-2/spark-distributed-analytic-framework/). Example batch scripts will follow soon.

## Going beyond

We started the [AstroLab Software](https://astrolabsoftware.github.io/) project as a platform for big data developments in astronomy, with focus on Apache Spark. There are several projects of interest for LSST, but they largely go beyond.


In case you want to generate your own DESC python + Apache Spark kernel, follow these steps:

```bash
# Clone the repo
git clone https://github.com/astrolabsoftware/spark-kernel-nersc.git
cd spark-kernel-nersc

# Create the kernel - it will be stored under
# $HOME/.local/share/jupyter/kernels/
python desc-kernel.py \
  -kernelname desc-pyspark-custom \
  -pyspark_args "--master local[4] \
  --driver-memory 32g --executor-memory 32g \
  --packages com.github.astrolabsoftware:spark-fits_2.11:0.7.1"
```

And then select the kernel `desc-pyspark-custom` in the JupyterLab [interface](https://jupyter-dev.nersc.gov/).
More information can be found at [spark-kernel-nersc](https://github.com/astrolabsoftware/spark-kernel-nersc).
