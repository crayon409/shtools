
SERVER := "server"
CLIENT := "client"
GO := $(shell which go)

cfssl::install:
	GOBIN=${PWD}/gobin GOPROXY=https://goproxy.cn \
	${GO} install github.com/cloudflare/cfssl/cmd/...@latest
.PHONY:cfssl::install


install: clean
	cfssl genkey -initca ./conf/csr.json | cfssljson -bare ${SERVER}
	# cfssl gencert -initca -ca=${SERVER}.pem -ca-key=${SERVER}-key.pem -config=./conf/config.json -profile=www ./conf/csr.json |cfssljson -bare ${SERVER}
	cfssl genkey -initca ./conf/csr.json | cfssljson -bare ${CLIENT}
.PHONY: install


clean:
	@rm -rf *.csr *.pem
.PHONY: clean


echo:
	@echo ${SERVER} ${CLIENT}
