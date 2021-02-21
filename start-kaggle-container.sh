#!/bin/bash

# get the data from "Our World in Data"
script_dir=`dirname "$0"`

remote_vaccinations_world="https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/vaccinations/vaccinations.csv"
local_vaccinations_world="$script_dir/data/vaccinations_world.csv"
# make sure we have a data file in a data dir in the locaton of the script
if [ ! -f $local_vaccinations_world ] ; then
    echo "Downloading data file from $remote_vaccinations_world"
    mkdir data
    #wget -P $script_dir/data "$remote_vaccinations_world"
    curl --create-dirs $remote_vaccinations_world --output $local_vaccinations_world
fi

remote_vaccinations_states="https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/vaccinations/us_state_vaccinations.csv"
local_vaccinations_states="$script_dir/data/vaccinations_state.csv"
# make sure we have a data file in a data dir in the locaton of the script
if [ ! -f $local_vaccinations_states ] ; then
    echo "Downloading data file from $remote_vaccinations_states"
    mkdir data
    #wget -P $script_dir/data "$remote_vaccinations_states"
    curl --create-dirs $remote_vaccinations_states --output $local_vaccinations_states
fi

# start the container only if it is not already running
running_images=`docker ps -a | grep kaggle-images`
if [ -z "$running_images" ] ; then
    docker ps
    # Mount the current working directory, hopefully including this git repo in its' directory structure
    docker run --rm -it -v $PWD:/home/jupyter -p 8080:8080 --env NOTEBOOK_DISABLE_ROOT=true gcr.io/kaggle-images/python /run_jupyter.sh 
fi