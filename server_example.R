# ===================================================
# RRest Example
# 
# To run, run
#    Rscript server_example.R 
# 
# For command line example, in another terminal, run
# curl -X POST http://0.0.0.0:9090 -d '{"fun": "rnorm", "params" : {"n" : 100}}'
# 
# For R example, open another R session and run the contents of "client_example.R"
# 
# The server expects a JSON object of the following form:
# {
#    "fun" : functionName,
#    "params" : {
#       "param1Name" : param1Value,
#       ...
#    }
# }
# 
# ==================================================


source("rrest.R")

setValue <- function(key, value) {
   assign(key, value, envir = data_env)
   NULL
}

getValue <- function(key) {
   get(key, envir = data_env)   
}

# Add to environment
fun_env <- new.env()
data_env <- new.env()
assign("runif", runif, env = fun_env)
assign("rnorm", rnorm, env = fun_env)
assign("setValue", setValue, env = fun_env)
assign("getValue", getValue, env = fun_env)

# Start Server
runServer(host = "0.0.0.0", port = 9090, app = list(call = restServer(fun_env)))

