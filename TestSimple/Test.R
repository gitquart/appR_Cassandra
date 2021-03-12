library('inline')
library('Rcpp')

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
