FROM ubuntu:trusty

RUN apt-get update

RUN apt-get install -yy \
      build-essential \
      curl

ARG NUTCRACKER_VERSION
RUN curl -L https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/twemproxy/nutcracker-${NUTCRACKER_VERSION}.tar.gz  -o /tmp/nutcracker.tar.gz && \
    tar -C /tmp -xzvf /tmp/nutcracker.tar.gz

RUN    cd /tmp/nutcracker-${NUTCRACKER_VERSION} && \
    ./configure && \
    make && \
    make install && \
    rm -rf /tmp/nutcracker-${NUTCRACKER_VERSION}
