#!/bin/bash

# get the data from our world of data
script_dir=`dirname "$0"`
remote_source_file="https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/vaccinations/vaccinations.csv"
dest_data_file="$script_dir/data/vaccinations.csv"


if [ ! -f $dest_data_file ] ; then
    echo "Downloading data file from $remote_source_file"
    mkdir data
    #wget -P $script_dir/data "$remote_source_file"
    curl --create-dirs $remote_source_file --output $dest_data_file
fi

docker run --rm -it -v $PWD:/home/jupyter -p 8080:8080 --env NOTEBOOK_DISABLE_ROOT=true gcr.io/kaggle-images/python /run_jupyter.sh 