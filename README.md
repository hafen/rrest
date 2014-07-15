rrest Documentation 
====================


#### Example Server
To start the example server, run
```bash
Rscript server_example.R
```


#### Example Clients
For example R client, run client_example.R

For example client in bash:
```bash
curl -X POST http://0.0.0.0:9090 -d '{"fun": "rnorm", "params" : {"n" : 100, "mean": 5}}'
curl -X POST http://0.0.0.0:9090 -d '{"fun": "setValue", "params" : {"key" : "a", "value" : 1 }}'
curl -X POST http://0.0.0.0:9090 -d '{"fun": "getValue", "params" : {"key" : "a" }}'
```

