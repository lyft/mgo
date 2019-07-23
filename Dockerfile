
FROM ubuntu:18.04

# TODO/NOMERGE: move into next layer to avoid capture into image
RUN apt-get update

# perl is for shasum
# git is required for go modules
# gcc/libsasl2-dev are required because of the tests
RUN apt-get -y install curl binutils perl git gcc libsasl2-dev && \
    apt-get -y install supervisor && \
    rm -rf /var/lib/apt/lists/*

RUN : \
    && curl --location 'http://downloads.mongodb.org/linux/mongodb-linux-x86_64-2.6.12.tgz' --output /tmp/mongodb-linux-x86_64-2.6.12.tgz \
    && echo '339083cf55e6f4a371027ddb2ae349cd06cede91bd5e747309f40d5d965333ff  /tmp/mongodb-linux-x86_64-2.6.12.tgz' | shasum -a 512256 --check \
    && :

RUN : \
    && curl --location 'https://dl.google.com/go/go1.12.7.linux-amd64.tar.gz' --output /tmp/go1.12.7.linux-amd64.tar.gz \
    && echo '60bcd6b16e19126c057ce9a1a5b2c8c4ff86e21b9035a3192b97eece5d6d5fe6  /tmp/go1.12.7.linux-amd64.tar.gz' | shasum -a 512256 --check \
    && :

RUN : \
    && tar -C / -xzf /tmp/go1.12.7.linux-amd64.tar.gz \
    && (cd /tmp && ln -sf mongodb-linux-x86_64-2.6.12 mongodb) \
    && :

ENV GOPATH /go

COPY . /src
