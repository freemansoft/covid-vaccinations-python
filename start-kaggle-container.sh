#!/bin/bash

# get the data from "Our World in Data"
script_dir=`dirname "$0"`
remote_source_file="https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/vaccinations/vaccinations.csv"
dest_data_file="$script_dir/data/vaccinations.csv"

# make sure we have a data file in a data dir in the locaton of the script
if [ ! -f $dest_data_file ] ; then
    echo "Downloading data file from $remote_source_file"
    mkdir data
    #wget -P $script_dir/data "$remote_source_file"
    curl --create-dirs $remote_source_file --output $dest_data_file
fi

# start the container only if it is not already running
running_images=`docker ps -a | grep kaggle-images`
if [ -z "$running_images" ] ; then
    docker ps
    # Mount the current working directory, hopefully including this git repo in its' directory structure
    docker run --rm -it -v $PWD:/home/jupyter -p 8080:8080 --env NOTEBOOK_DISABLE_ROOT=true gcr.io/kaggle-images/python /run_jupyter.sh 
fi