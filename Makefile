
SERVER := "server"
CLIENT := "client"

install: clean
	cfssl genkey -initca ./conf/csr.json | cfssljson -bare ${SERVER}
	# cfssl gencert -initca -ca=${SERVER}.pem -ca-key=${SERVER}-key.pem -config=./conf/config.json -profile=www ./conf/csr.json |cfssljson -bare ${SERVER}
	cfssl genkey -initca ./conf/csr.json | cfssljson -bare ${CLIENT}
.PHONY: install

clean:
	@rm -rf *.csr *.pem

echo:
	@echo ${SERVER} ${CLIENT}
