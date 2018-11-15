

#list of jars: currently SparkFITS
SF=/global/homes/p/plaszczy/Spark/spark-fits-apps/lib/spark-fits_2.11-0.6.0.jar
echo "SparkFITS=$SF"

export JARS=$SF



export EXEC_CLASSPATH=$JARS

module load spark/2.3.0
module load sbt
start-all.sh 

export PYSPARK_DRIVER_PYTHON=ipython

#default options
export SPARKOPTS="--master $SPARKURL"

