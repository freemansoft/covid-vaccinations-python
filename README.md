# Covid Vaccinations vs population

Tracking Covid vaccinations across the globe.  _How far have we travelled along the vaccination journey?_

![Vaccinations Scatter plot](log-log-scatter-plot.png)

## Datasets

* Our world in Data
  * <https://github.com/owid/covid-19-data/tree/master/public/data/vaccinations>
  * <https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/vaccinations/vaccinations.csv>
  * <https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/vaccinations/us_state_vaccinations.csv>
* Original vaccination dataset before I found _our world of data_  This data set combines multiple data cents from the _our world in data_ repository.
  * <https://www.kaggle.com/gpreda/covid-world-vaccination-progress> by <https://www.kaggle.com/gpreda>

## Platform

I used the Kaggle Python Container Image. It is way overkill for this task.

* [Kaggle Python Container Image](https://github.com/Kaggle/docker-python) data science docker container to **rule them all**
* Any reasonable anaconda or Jupyter notebook environment _your link here_. You can use any _Anaaconda_ / _Jupyter Notebook_ environment.

## Genesis / Credits

* [Kenny Freeman](https://github.com/Ken-Freeman) covid project that got me interested
* [Our world in data](https://github.com/owid/covid-19-data)
* [Gabriel Preda](https://www.kaggle.com/gpreda) Kaggle datsethttps://www.kaggle.com/gpreda

## Execution with provided script

The included bash script will download the data and run the server.

1. Open a terminal and `cd` to this directory
1. execute `bash start-kaggle-container.sh` It will
    1. download the data
    1. download the docker image
    1. run the container and Jupyter notebook server
1. Open a browser to <http://localhost:8080/>
1. Open and run `code/vaccinations_by_country.ipynb` in the Jupyter Notebook browser view in the left pane.
    1. It will prompt you for city or state and pick the correct data file based on your prompt

## Manual Execution

1. Open a terminal and `cd` to this directory
1. Make a directory in this directory called `data`
1. Blah blah the csv files [from Github](https://github.com/owid/covid-19-data/blob/master/public/data/vaccinations/vaccinations.csv)  and put it in `data/vaccinations.csv`
1. Download the global vaccination data and the us state vaccination data.  This can be done from inside the notebook or the command line

    ```bash
    curl https://covid.ourworldindata.org/data/vaccinations/vaccinations.csv -o data/vaccinations_world.csv
    curl https://covid.ourworldindata.org/data/vaccinations/us_state_vaccinations.csv -o data/vaccinations_state.csv
    ```

1. Start your Jupyter server
    1. You can use any environment, local, docker, etc
    2. I use the [Kaggle Python Docker image](<https://github.com/Kaggle/docker-python>) by running `bash start-kaggle-container.sh` in this directory.  It will download the container **18GB** and start the Jupyter server.
1. Open `Jupyter Notebook` server.
    1. Open a browser to <http://localhost:8080/> or wherever your notbook server is locate
    2. Open and run `vaccinations_by_country.ipynb` in the Jupyter Notebook browser view in the left pane.

## Shutting down the server

There are a couple ways to terminate the server

1. `ctrl-c` in the terminal window and answer `Y`
1. Terminate the server in the _Jupyter Notebook_ menu in the browser window

## Demo: order of operations

Source data may be missing days and columns

![Sample Data 2 Countries](covid_vaccinations_alignment_synthesis.png)

We _add missing days_ and _interpolate or fill missing cell values_ `vaccinations_by_country.ipynb`

![loading and adjusting the data flow](covid_vaccinations_demo_flow.png)

Sample results from various data phases 19 Feb 2021 data set

| Phase                    | Number of Records | Daily Vaccinations (populated) | Total Vaccinations (populated) | Vaccinated per 100 (populated) |
| ------------------------ | ----------------- | ------------------------------ | ------------------------------ | ------------------------------ |
| Initial Load             | 3679              | 3542                           | 2461                           | 1367                           |
| Post row fill            | 6831              | 3432                           | 2461                           | 1367                           |
| Post value interpolation | 6831              | 3868                           | 4008                           | 1837                           |

## NVidia AI Workbench

The following files were added specifically for AI Workbench

| File             | Notes                                                  |
| ---------------- | ------------------------------------------------------ |
| apt.txt          | none                                                   |
| postBuild.bash   | none                                                   |
| preBuild.bash    | none                                                   |
| requirements.txt | This file may or may not already exist in your project |
| variables.md     | none                                                   |
| .gitattributes   | LFS settings for models and data                       |

.project is the project config files. [See the project spec reference page](https://docs.nvidia.com/ai-workbench/user-guide/latest/reference/projects/spec.html#workbench-project-components)

The files here were created by creating a sample project and then copying those .project files here

| File                 | Notes |
| -------------------- | ----- |
| .project/configpacks | ?     |
| .project/spec.yaml   | ?     |

### LFS Should be enabled for models and data

No I haven't figured out the commands that AI Workbench runs

See [Configuring Large File Storage in GIT](https://docs.github.com/en/repositories/working-with-files/managing-large-files/configuring-git-large-file-storage)

The following said "already supported"

```shell
git lfs track "data/**"
git lfs track "models/**"
```

I think the .git/.gitconfig should end up including include

```config
[lfs]
        repositoryformatversion = 0
```
