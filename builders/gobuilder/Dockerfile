FROM golang:latest

RUN apt-get update
RUN apt-get install unzip

# set env
ENV GOHOME /go
ENV GOPATH $GOHOME
ENV PATH ${GOPATH}/bin:$PATH

# Install dep
RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

# Install golint
RUN go get -u github.com/golang/lint/golint

# Install protoc
ARG PROTOC_ZIP=protoc-3.6.1-linux-x86_64.zip
RUN curl -OL https://github.com/google/protobuf/releases/download/v3.6.1/$PROTOC_ZIP

RUN unzip -o $PROTOC_ZIP -d protoc3
RUN mv protoc3/include/* /usr/local/include/
RUN mv protoc3/bin/* /usr/local/bin/

#RUN unzip -o $PROTOC_ZIP -d /usr/local bin/protoc
RUN rm -f $PROTOC_ZIP
RUN rm -rf protoc3

RUN go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
RUN go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
RUN go get -u github.com/golang/protobuf/protoc-gen-go