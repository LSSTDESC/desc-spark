
#SPARKVERSION mus be defined from outside

#list of jars: currently SparkFITS
SF=/global/homes/p/plaszczy/SparkLibs/spark-fits.jar
HP=/global/homes/p/plaszczy/SparkLibs/jhealpix.jar
S3D=/global/homes/p/plaszczy/SparkLibs/spark3d.jar

export JARS="$SF,$HP,$S3D"

# this seems useless
export EXEC_CLASSPATH=$JARS

#do not load your personal python stuff from .local
export PYTHONUSERBASE=

module load spark/$SPARKVERSION
start-all.sh 


#config NERSC (from Lisa G)
executor_cores=32
executor_mem=100
driver_mem=100
n_executors=$(($SLURM_JOB_NUM_NODES-1))

total_mem=$(($driver_mem+$n_executors*$executor_mem))
ncores_tot=$(($n_executors*$executor_cores))

echo "mem=${total_mem}"
echo "cores=${ncores_tot}"

export SPARKOPTS="--master $SPARKURL --driver-memory ${driver_mem}g --total-executor-cores ${ncores_tot} --executor-cores ${executor_cores} --executor-memory ${executor_mem}g"

#enter shifter
shifter /bin/bash
echo "OK in shifter from now"
