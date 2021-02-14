#!/bin/bash

#mkdir data
#cd data
#wget https://www.kaggle.com/gpreda/covid-world-vaccination-progress/download data
#gunzip archive.zip

script_dir=`dirname "$0"`

if [ ! -f $script_dir/data/country_vaccinations.csv ] ; then
    echo " you need to download the data set into a ./data directory from https://www.kaggle.com/gpreda/covid-world-vaccination-progress"
    exit 1
fi

docker run --rm -it -v $PWD:/home/jupyter -p 8080:8080 --env NOTEBOOK_DISABLE_ROOT=true gcr.io/kaggle-images/python /run_jupyter.sh 