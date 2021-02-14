# Covid Vaccinations vs population

![Vaccinations Scatter plot](log-log-scatter-plot.png)


## Datasets
* Vaccination dataset https://www.kaggle.com/gpreda/covid-world-vaccination-progress by https://www.kaggle.com/gpreda

## Platform
I used the Kaggle Python Container Image. You can use any _Anaaconda_ / _Jupyter Notebook_ environment.
* The [Kaggle Python Container Image](https://github.com/Kaggle/docker-python) data science docker container to **rule them all**
* Any reasonable 

## Genesis / Credits
* [Kenny Freeman](https://github.com/Ken-Freeman) covid project that got me interested
* [Gabriel Preda](https://www.kaggle.com/gpreda) Kaggle datsethttps://www.kaggle.com/gpreda

## Using these files
1. Make a directory in this directory called `data`
1. Download the csv file (from Kaggle)[https://www.kaggle.com/gpreda/covid-world-vaccination-progress/download]  and put it in `data/country_vaccinations.csv`
1. Start your Jupyter server
    1. You can use any environment
    1. I used the Kaggle Python Docker container by running `bash start-kaggle-container.sh` in this directory.  It will download the container **18GB** and start the Jupyter server.
1. Open `Jupyter Notebook` server.  
    1. Open a browser to http://localhost:8080/ or wherever your notbook server is locate
    1. Open and run `vaccines_demo.jbynb` in the Jupyter Notebook browser view in the left pane.

## Shutting down the server
There are a couple ways to terminate the server

1. `ctrl-c` in the terminal window and answer `Y`
1. Terminate the server in the _Jupyter Notebook_ menu in the browser window