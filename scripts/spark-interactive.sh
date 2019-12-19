#!/bin/bash
nargs=$#
if ! [ $nargs -eq 2 ]; then
echo "##################################################################################"
echo "A script to log on interactive nodes with proper Spark setup"
echo "once logged in: source init_spark.sh"
echo ">"
echo "usage: "
echo "source spark-interactive.sh N(#nodes) t(mins)"
echo ">"
echo "notes: "
echo " -each cori node has 32 cores and 100GB RAM (from which 60% will be used for cache)"
echo " -if you ask for less than 30 mins you will be running on the debug queue"
echo "##################################################################################"
return
fi
declare -i NODES
NODES=$1

declare -i t
t=$2

if [ $t -gt 30 ]; then
queue=interactive
else
queue=debug
fi

echo "running on $NODES nodes for $t mins on queue $queue"

export NODES

export SPARKVERSION=2.4.4
#IMG=nersc/spark-$SPARKVERSION:v1

#IMG=lgerhardt/spark_test:v1

#export SPARKVERSION=2.3.0
IMG=registry.services.nersc.gov/plaszczy/spark_desc:v$SPARKVERSION



echo "IMG=$IMG"

if ! [ -d /global/cscratch1/sd/$USER ] ; then 
echo "creating NodeCache in /global/cscratch1/sd/$USER" 
mkdir /global/cscratch1/sd/$USER
fi

cmd="salloc -N $NODES -t $t -C haswell -q $queue --image=$IMG --volume='/global/cscratch1/sd/$USER/tmpfiles:/tmp:perNodeCache=size=200G'"
echo $cmd
eval $cmd

#salloc -N $NODES -t $t -C haswell -q $queue --image=$IMG --volume="/global/cscratch1/sd/$USER/tmpfiles:/tmp:perNodeCache=size=200G"
