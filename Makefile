run:
	docker build . -t gerardc98/jupyter-docker
	docker run --name my-jupyter-docker \
	-v ~/jupyter-docker/:/home/gcastro/ \
	-p 8888:8888 \
	gerardc98/jupyter-docker