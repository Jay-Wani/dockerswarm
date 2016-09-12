# dockerswarm

In this project we would be using docker swarm kit to orchestrate containers & run an app in a overlay network with automatic service discovery.

Docker 1.12 comes wihh an inbuilt orchestration engine and we would be using this feature to run a basic website hits app created in python & using redis as a backend database to store the number of hits to that page. 

The count would be stored in the variable 'totalhits' in redis.


# Getting Started - Installation

We have to start by installing Docker 1.12 on your machine. 

Install Docker :            [Docker](https://docs.docker.com/installation/) and 


After installing Docker you would then need to clone this project onto our docker host machine, using the "git clone" command.


# Cloning Git Repository

In order to get started be sure to clone this project onto your Docker Host. Create a directory on your host.
Please note that the demo webservices will inherit the name from the directory you create. If you create a folder named test. Then the services will all be named test-web, test-redis, test-lb. Also, when you scale your services it will then tack on a number to the end of the service you scale.

git clone https://github.com/Jay-Wani/dockerswarm.git



# Analyze the Dockerfile 

We will use this Dockerfile to build the image of webservices app container that we would use with the docker orchestrator. 

```yaml
ADD . /sampleapp
WORKDIR /sampleapp
RUN apk-install python \
    python-dev \
    py-pip &&\
    pip install -r requirements.txt
CMD ["python", "app.py"]
```

The Dockerfile is used to build Docker images.



# Build the docker image from the Dockerfile.

```yaml
docker build -t pythonapp .
```

This command needs to be run in the folder in which you cloned the Git reposiroty.
It would take a while to run and once finished an image named ```pythonapp``` would be created. 

We will use the ```docker images``` command to check that this images has been created. 



# Docker 1.12 - Orchestration using docker swarm 

SwarmKit is a toolkit for orchestrating distributed systems at any scale. It includes primitives for node discovery, raft-based consensus, task scheduling and more.

Its main benefits are:

    Distributed: SwarmKit uses the Raft Consensus Algorithm in order to coordinate and does not rely on a single point of failure to perform decisions.
    Secure: Node communication and membership within a Swarm are secure out of the box by using TLS. 
    Simple: SwarmKit is operationally simple and minimizes infrastructure dependencies. It does not need an external database to operate.


# Create a Docker Swarm - Cluster with 3 manager nodes and 4 worker nodes. 

Create 7 VM's that you would be using for this docker lab. Ideally these can be easily created on any cloud platform. 

Run the following command on the first machine, 

```yaml
docker swarm init
```

This command would produce the below result. 




# STEP 1 : Creating an overlay network for the app & the backend redis database

Create an overlay network for our docker containers to run in. Docker 1.12 come with automatic service dicsovery. 
As a result the different containers should be able to locate each other if these contrainers are on the same overlay network. 

```yaml
docker network create --driver overlay my-network
```


# STEP 2 : Creating a docker service for redis database. 

Create an overlay network for our docker containers to run in. Docker 1.12 come with automatic service dicsovery. 
As a result the different containers should be able to locate each other if these contrainers are on the same overlay network. 




