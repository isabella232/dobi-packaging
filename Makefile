#!/usr/bin/make -f

d := $(shell date)
r := $(shell git rev-parse --short HEAD)

build:
	mkdir -p /tmp/go/src/github.com/dnephin
	cp -a vendor/* /tmp/go/src
	ln -s `pwd` /tmp/go/src/github.com/dnephin/dobi
	HOME=/tmp GOCACHE=/tmp /usr/lib/go-1.13/bin/go build \
	    -ldflags "-X github.com/dnephin/dobi/cmd.gitsha=$r \
	              -X \"github.com/dnephin/dobi/cmd.buildDate=$d\"" \
	    -o dobi \
	    .

