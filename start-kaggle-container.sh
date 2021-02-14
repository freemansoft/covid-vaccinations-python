#!/bin/bash

# get the data from our world of data
mkdir data
wget -P data "https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/vaccinations/vaccinations.csv"
#curl --create-dirs  https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/vaccinations/vaccinations.csv --output data/vaccinations.csv

script_dir=`dirname "$0"`

if [ ! -f $script_dir/data/country_vaccinations.csv ] ; then
    echo " you need to download the data set into a ./data directory from https://www.kaggle.com/gpreda/covid-world-vaccination-progress"
    exit 1
fi

docker run --rm -it -v $PWD:/home/jupyter -p 8080:8080 --env NOTEBOOK_DISABLE_ROOT=true gcr.io/kaggle-images/python /run_jupyter.sh 