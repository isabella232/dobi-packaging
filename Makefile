#!/usr/bin/make -f

d := $(shell date)
r := $(shell git rev-parse --short HEAD)

build:
	pwd
	ls -l
	HOME=/tmp GOCACHE=/tmp /usr/lib/go-1.13/bin/go build \
		-mod vendor \
	    -ldflags "-X github.com/dnephin/dobi/cmd.gitsha=$r \
	              -X \"github.com/dnephin/dobi/cmd.buildDate=$d\"" \
	    -o dobi \
	    .

