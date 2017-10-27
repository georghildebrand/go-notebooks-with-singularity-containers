#!/bin/bash

# set up golang
PATH=/usr/local/go/bin:$PATH
GOPATH=/go
echo """
export GOPATH /go
export PATH /usr/local/go/bin:$GOPATH/bin:$PATH
""" >> /environment

mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
# install gophernotes
go get golang.org/x/tools/cmd/goimports
go get -tags zmq_3_x github.com/gopherds/gophernotes

