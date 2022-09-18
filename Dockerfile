# We use the image base-notebook to build our image on top. More info at: https://hub.docker.com/r/jupyter/base-notebook
FROM jupyter/base-notebook

# we enable jupyter lab, instead of the default juyter notebook command, so 
# we don't have to use it when running the container with the option -e
ENV JUPYTER_ENABLE_LAB=yes