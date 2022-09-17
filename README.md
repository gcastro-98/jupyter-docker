# jupyter-docker

Docker image whose containers:
- Open a Jupyer notebook when initialized (by default the server runs locally at ``http://127.0.0.1:8888``)
- They can access local folders from the actual OS
This is the answer of the problem posed at the AGILE DS 2022 course of the _FPDS_ [master course](https://mat.ub.edu/sciencedata/) at [UB](https://www.ub.edu/web/portal/ca/).

## Create the image 

Once we placed ourself in the repo folder, we type:
```console
sudo make
```
To execute the ``Makefile`` with all the proper instructions to build the image and to run a container.

### Alternatively
Instead, run 
```console
docker build . -t gerardc98/jupyter-docker
```
And use the Docker Desktop GUI to run a container and open it.

## Access the Jupyter lab

Use the Docker Desktop GUI to access the proper URL. By default, it is ``http://127.0.0.1:8888/lab`` and you will be asked for a ``token``.
This is found after the ``?token=`` clause generated when the Docker container is ran (you always could click that whole link).

