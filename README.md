# job-skeleton


This repository contains a skeleton of python project which will be registred in [workflow](https://github.com/project-workflow-kubernetes/workflow-controler).

### Dependencies

Please, install:
- [Git Large File Storage](https://git-lfs.github.com/) which will make github deal efficiently with large files. `brew install git-lfs`

### Setup
To setup your own project you should choose a name to your job (e.g. `my-job`) and:

1. Fork this repository

2. Choose a name for your new job (e.g. my-job)

3. On the left bar go to `Settings > General > Advanced > Expand > Rename Repository` and change the field `Repository name` and `Path` to `my-job` and click on `Rename project` and `Save changes`

4. On the left bar go to `CI / CD > Pipelines > Run pipeline > Create Pipeline` and wait until status of build become green and `build`.

5. Clone the new repository in our machine

6. In your command line run:
```bash
cd my-job
bash .bootstrap.sh -j my-job up
```
to rename folder and variables inside files which make reference to the job name.

> **NOTE**: To undo changes: `bash .bootstrap -j my-job down`

7. Put all your data inside the folder `/data`

8. Put all your code inside the folder `/src/my-job/`

9. Commit and push your changes

10. Fill `dependencies.yaml` file that must contain all dependency structure of your job.

For each task (or script), you should specify a list of inputs, list of outputs, the docker image related with this task and finally the command to run the task inside the container. All the inputs files must be in the folder `/data/` and all tasks must be in `/src/my-job/`.

The following diagram or job

![dag|100x100,50%](images/DAG-job-python.jpg)

will result in the dependencies file available [here](https://github.com/project-workflow-kubernetes/job-python/blob/master/dependencies.yaml).

11. Commit your changes and check in [travis](https://travis-ci.com/) if the build was successful


> **NOTE**: Your dependencies must be a DAG (Directed Acyclic Graph)

> **NOTE**: If you need to install new python packages, add them in `setup.py` or `requirements.txt`
