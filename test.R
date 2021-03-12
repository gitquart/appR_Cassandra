
# Respuesta Datastax
# 
# I'm sure it is, though I don't know a lot of R. There are two ways you could do it:
#   1) use the new REST/GraphQL/DocumentAPI API's
#   2) look around for an R package to directly connect to cassandra (these are often wrappers around the C or Java Driver)
# 
# I would recommend using the REST/etc API except in some very specific performance related use cases
# Note: There is no way to connect RCassandra to Datastax, the C/C++ driver is needed. 


install.packages('inline')
install.packages('Rcpp')
install.packages('rstan')
library('inline')
library('Rcpp')
library('rstan')

### # start with pure C/C++ function and assign the source code to
### #  a variable which we call here includesrc
includesrc <- '
int fibonacci(const int x){
  if (x == 0) return(0);
  if (x == 1) return(1);
  return fibonacci(x-1) + fibonacci(x-2);
}'

### # define the body of the C/C++ program
fibCppBody <- '
int x = Rcpp::as<int>(xs);
return Rcpp::wrap( fibonacci(x) );'

### # pass the above C/C++ function as an argument
### # to cxxfunction()
fibRcpp <- inline::cxxfunction(sig = signature(xs = "int"),
                               plugin = "Rcpp",
                               incl = includesrc,
                               body = fibCppBody)





sapply(1:10, fibRcpp, USE.NAMES = FALSE)