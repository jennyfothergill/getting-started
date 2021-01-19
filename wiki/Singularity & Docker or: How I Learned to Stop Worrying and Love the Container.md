# Why Docker #

See this [link](https://towardsdatascience.com/docker-for-data-science-4901f35d7cf9) for a quick primer on why docker is a great tool for doing (data) science. 

# Installing Docker #

## OSX ##
---------
[Reference](https://docs.docker.com/docker-for-mac/install/) 

### Preflight Notes ###
* Docker for Mac requires OS X El Capitan 10.11 or newer macOS
* VirtualBox prior to version 4.3.30 must NOT be installed (it is incompatible with Docker for Mac). If you have a newer version of VirtualBox installed, it’s fine.

### Installation ### 
https://download.docker.com/mac/stable/Docker.dmg

## Linux (labtops) ##
---------------------

### Installation ###


```
#!bash

sudo apt install docker
sudo usermod -a -G docker $USER 
```
Now completely log out (when in doubt, reboot)


# Using Docker #
----------------

Docker will automatically download containers for you:

```
#!bash

docker run -itp 8888:8888 cmelab/mbuild:latest jupyter notebook --notebook-dir=/home/ --ip='*' --port=8888 --no-browser --allow-root
```

# Why Singularity #

Singularity has support on difference national super computing clusters and allows us to leverage docker in a secure way. 

This isn't meant to be a comprehensive guide but will provide enough information to build a singularity image for plankton. You will need to install docker as a first step. To test, run `docker info`. If you get an error like this `ERROR: Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?` you need to start docker. Now `cd` into the docker folder in `plankcton` and run

```
docker build . -f Dockerfile -t cmelab/planckton:demo 
```  
To build the image. This will take awhile (40 minutes on a lower end computer)! We are telling docker to use the `Dockerfile` as the instructions on how to build the image, and we are telling docker to "tag" the image  with `cmelab/planckton:demo`. Tags are a way to stay organized when building docker images. If you want to push this image to a docker image repository (such as [docker hub](https://hub.docker.com/)) then use a tag like `username/planckton:demo`.

Now to create the singularity image we have two options. If the docker image is pushed to a container repository, we can pull the image down like this `singularity pull docker://cmelab/planckton:beta`. Another option is to use the `Singularity.latest` file to build an image. This file tells singularity to create an image from a docker image (which could be from a repository or exist locally)  You will need to edit the image tag on the from line in this file (in this example, it would need to be changed to `From: cmelab/planckton:demo`   

## Notes ##

`singularity pull  shub://mikemhenry/cme-lab-images:hoomd`