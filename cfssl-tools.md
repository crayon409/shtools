
```sh
cfssl gencert -initca -config=conf.json -profile=www csr.json|cfssljson -bare server
```

csr.json

```json
{
    "CA":{"expiry":"87600h","pathlen":0},
    "CN": "localhost",
    "hosts": [
        "localhost"
    ],
    "key": {
        "algo": "rsa",
        "size": 2048
    },
    "names": [
        {
            "C": "US",
            "ST": "CA",
            "O": "Jufent",
            "OU": "Jufeng",
            "L": "San Francisco"
        }
    ]
}
```
