
```sh
openssl genpkey -algorithm rsa -out private.pem
openssl req -new -key private.pem -out csr.csr -subj "/C=Zh/ST=JS/L=NJ/O=PUT Inc./OU=put/CN=localhost"
openssl x509 -req -in csr.csr -days 36500 -signkey private.pem -out private.crt
```







