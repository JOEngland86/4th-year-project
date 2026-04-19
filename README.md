# SageMath Jupyter Notebooks (Dockerised)

This repository contains **SageMath Jupyter notebooks** supporting my project. The environment is fully containerised using **Docker**, so the notebooks can be run without installing SageMath or Python locally.


### Purpose of this repository
This repository is intended to: 
1. document computational exploration carried out throughout thesis in correct format
2. support theoretical work
3. ensure reproducibility
4. accompany written thesis
It is not intended as a standalone software package.


---

## The Repository contains Jupyter notebooks in the notebooks folder. 
Inside this folder, there are two more folders. The **Main Code** folder houses the final versions of the code which were used to produce the plots seen in my thesis and the **code throughout project** folder includes notebooks displaying notebook iterations created throughout project as documented and discussed in Lab book.

---

## Requirements to view work in correct format
To run the sagemath environment you must install docker desktop using either of the following resources: 

- **Docker Desktop**
  - Windows / macOS: https://www.docker.com/products/docker-desktop/
  - Linux: Docker Engine via your package manager

No local SageMath or Python installation is required.

---

## Running the notebooks with Docker

### - Build the Docker image

From the root of the local github repository cloned from the online repository:

bash (need space dot for it to work)
docker build -t sage-jupyter .


It will take a long time to build the first time but this only needs to be done once (or when the Dockerfile changes). 
sage-jupyter is the name I chose for the docker image. Could have given it any name but the name must be the same in docker build and docker run.

---

### Start Jupyter notebook
For Windows type following in PowerShell:
docker run -p 9000:8888 -v ${PWD}:/app sage-jupyter
 
For macOS / Linux
docker run -p 9000:8888 -v $(pwd):/app sage-jupyter

This line is running jupyter within sage within docker. 8888 represents the port inside container and 9000 represents the port on local computer. 

Then open a browser and go to:
http://localhost:9000

Jupyter will start with the SageMath kernel available.

---
### Summary of Version control workflow used
Typical workflow used when working on or editing notebooks:
1. git pull
2. Start Jupyter via Docker
3. Edit and save notebooks
4. git add notebooks
5. git commit
6. git push

---
### Editing jupyter notebooks
To make any changes to notebooks, clone to local repository but do not commit changes and push otherwise original repository permanently changed. Alternatively, fork repository to make any changes. 

---
### Extra information on SageMath
The Docker image uses the official sagemath/sagemath image.
On Apple Silicon Macs (M1/M2/M3), Docker runs Sage via x86_64 emulation. This is expected and requires no additional configuration.

To view general documentation for SageMath, use: https://www.sagemath.org/
This documentation also includes a link to the corresponding sagemath github instead. 
