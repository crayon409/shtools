SERVER := "server"
CLIENT := "client"
GO := $(shell which go)
GOBIN :=${PWD}/gobin


install: clean cfsslinstall
	${GOBIN}/cfssl genkey -initca ./conf/csr.json | ${GOBIN}/cfssljson -bare ./pems/${SERVER}
	# ${GOBIN}/ gencert -initca -ca=${SERVER}.pem -ca-key=${SERVER}-key.pem -config=./conf/config.json -profile=www ./conf/csr.json | ${GOBIN}/cfssljson -bare ./pems/${SERVER}
	${GOBIN}/cfssl genkey -initca ./conf/csr.json | ${GOBIN}/cfssljson -bare ./pems/${CLIENT}
.PHONY: install

cfsslinstall:
	GOBIN=${GOBIN} GOPROXY=https://goproxy.cn \
	${GO} install github.com/cloudflare/cfssl/cmd/...@latest
.PHONY: cfsslinstall

clean:
	@rm -rf ./pems/*
	@rm -rf ${GOBIN}

echo:
	@echo ${SERVER} ${CLIENT}
