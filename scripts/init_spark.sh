

#list of jars: currently SparkFITS
SF=/global/homes/p/plaszczy/Spark/spark-fits-apps/lib/spark-fits_2.11-0.6.0.jar
echo "SparkFITS=$SF"

export JARS=$SF

# this seems useless
export EXEC_CLASSPATH=$JARS

module load spark/2.3.0
module load sbt
start-all.sh 

export PYSPARK_DRIVER_PYTHON=ipython

#default options
#export SPARKOPTS="--master $SPARKURL"


#config NERSC (from Lisa G)
executor_cores=32
executor_mem=100
driver_mem=10
n_executors=$(($SLURM_JOB_NUM_NODES-1))

total_mem=$(($driver_mem+$n_executors*$executor_mem))
ncores_tot=$(($n_executors*$executor_cores))

echo "mem=${total_mem}"
echo "cores=${ncores_tot}"

export SPARKOPTS="--master $SPARKURL --driver-memory ${driver_mem}g --total-executor-cores ${ncores_tot} --executor-cores ${executor_cores} --executor-memory ${executor_mem}g"
