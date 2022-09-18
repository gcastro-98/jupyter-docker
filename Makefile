run:
	docker build . -t $(USER)/jupyter-docker
	docker run -it --name my-jupyter-docker \
	-p 8888:8888 \
	-v $(PWD)/local/:/home/$(USER)/local/ \
	-e NB_USER=$(USER) \
	-e GRANT_SUDO=yes \
	-e CHOWN_HOME=yes \
	-e CHOWN_EXTRA=/home/$(USER)/local/ \
	-e CHOWN_EXTRA_OPTS='-R' \
	--user root  \
	-w /home/$(USER)/ \
	$(USER)/jupyter-docker 

# we could use "-e JUPYTER_TOKEN=<mytoken>" to set, as custom toke
# the password: "<mytoken>"