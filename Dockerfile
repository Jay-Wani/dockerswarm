FROM gliderlabs/alpine:latest
MAINTAINER Junaid Wani <w.m.junaid@gmail.com>
LABEL Description="Creating the build image for the Docker-Swarm sample voting app."

ADD . /sampleapp
WORKDIR /sampleapp
RUN apk-install python \
    python-dev \
    py-pip &&\
    pip install -r requirements.txt
CMD ["python", "app.py"]
