# jupyter-docker

Docker image whose containers:
- Open a Jupyer notebook when initialized (by default the server runs locally at ``http://127.0.0.1:8888``)
- They can access local folders from the actual OS. In this case, we will add the folder ``local`` of this same repository.

This is the answer of the problem posed at the AGILE DS 2022 course of the _FPDS_ [master course](https://mat.ub.edu/sciencedata/) at [UB](https://www.ub.edu/web/portal/ca/).

## Create the image & run a container

Once we placed ourself in the repo folder, to build the image and to run a container fulfilling the former objectives, we type:
```console
make
```
In particular, executing the ``Makefile`` is equivalent to manually
type the containing code. Below is presented and explained each of its lines' reason:

```console
docker build . -t $(USER)/jupyter-docker  # create an image
docker run -it --name my-jupyter-docker \  # run a container "my-jupyter-docker"
-p 8888:8888 \  # specify the port
-v $(PWD)/local/:/home/$(USER)/local/ \  # we include the "local" folder
-e NB_USER=$(USER) \  # we change the user: "jovyan" -> current one
-e GRANT_SUDO=yes \  # we grant administrator permissions
-e CHOWN_HOME=yes \  # we add permissions to modify /home dir
-e CHOWN_EXTRA=/home/$(USER)/local/ \  # and the "local" folder
-e CHOWN_EXTRA_OPTS='-R' \  # we add permissions to recursive folders
--user root  \  # necessary to take effect
-w /home/$(USER)/ \  # we change the working directory to this path
$(USER)/jupyter-docker  # image from which create the container
```
## Accessing the lab

Several ways to do it:
- Copy (or click) the link that appears at last starting, by default, with ``http://127.0.0.1:8888/lab?token=``
- Accessing with a browser to the URL ``http://127.0.0.1:8888/lab`` and 
enter the token that is found after the ``?token=`` clause (in the CLI 
after typing the ``make`` or typing ``jupyter server list`` in a CLI __inside__ the container)
- Setting the custom token ``<mytoken>`` by including the following line to 
the ``Makefile``. Then enter the lab just by typing such token into ``http://127.0.0.1:8888/lab``:
```console
-e JUPYTER_TOKEN=<mytoken> \
```

