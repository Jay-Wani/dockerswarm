# dockerswarm
 
In this project we would be using docker swarm kit to orchestrate containers & run an app in a overlay network with automatic service discovery.
 
Docker 1.12 comes wihh an inbuilt orchestration engine and we would be using this feature to run a basic voting app created in python & using redis as a backend database to store the number of hits to that page. 
 
The count would be stored in the variable 'totalhits' in redis.


# Getting Started - Installation

We have to start by installing Docker and Docker Compose on your machine. 

Install Docker :            [Docker](https://docs.docker.com/installation/) and 
Install Docker Compose :    [Docker Compose](https://docs.docker.com/compose/install/)

After installing Docker and Docker Compose we would now get stated by cloning this project onto our docker host machine. 


# Cloning Git Repository

In order to get started be sure to clone this project onto your Docker Host. Create a directory on your host. Please note that the demo webservices will inherit the name from the directory you create. If you create a folder named test. Then the services will all be named test-web, test-redis, test-lb. Also, when you scale your services it will then tack on a number to the end of the service you scale.
 
git clone https://github.com/Jay-Wani/dockercompose-sampleapp.git
 
 
# Analyze the Docker Compose file 
 
We will be using the below `docker-compose.yml` file to build the ecosystem. 
 
```yaml

version: '2'
services:
   python-app:
     build: .
     ports:
      - "5000:5000"
     volumes:
      - .:/code
     depends_on:
      - redis
   redis:
     image: redis
```
 
The yaml files are highly dependent on the spaces for formatting and running the commands, please ensure that the spaces in your file are exactly as shown in the example above.  
 
Version : This tells us about the version of docker-compose that we are using. 

Services : This denotes the configuration of the service that we are building. 
            Step 1 : We build the python-app from the Dockerfile placed in the current working directory where we are working.
            Step 2 : We map the port no 5000 on the localhost to the port 5000 on the container.
            Step 3 : We map our current working directory to the /code folder on the container
            Step 4 : We configure the container to talk to the redis container
 
 redis : We setup the redis container from the redis image
 
 
# Analyze the Dockerfile 
 
We will use this Dockerfile to build the image of webservices app container. 

```yaml
 ADD . /sampleapp
 WORKDIR /sampleapp
 RUN apk-install python \
     python-dev \
     py-pip &&\
     pip install -r requirements.txt
 CMD ["python", "app.py"]
```

 
# Compose Commands for bringing up the app.
 
```yaml
 docker-compose up -d
```
 
# Command for building your own image from Dockerfile
 
```yaml
 docker build -t sampleapp .
```
 

 
