FROM rust:1.48.0-buster

ARG PROTOBUF_VERSION=3.14.0

RUN apt-get update \
 && apt-get install -y autoconf automake libtool curl make g++ unzip \
 && curl -L https://github.com/protocolbuffers/protobuf/releases/download/v$PROTOBUF_VERSION/protoc-$PROTOBUF_VERSION-linux-x86_64.zip --output protoc.zip \
 && unzip protoc.zip -d /tmp/protoc-3 \
 && mv /tmp/protoc-3/bin/protoc /usr/local/bin/ \
 && mv /tmp/protoc-3/include/google /usr/local/include/ \
 && rm -rf protoc.zip /tmp/protoc-3
