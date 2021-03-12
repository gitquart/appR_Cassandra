#include <Rcpp.h>
using namespace Rcpp;

#include "Fibonacci.h"


//[[Rcpp::export]]
int fibonacci_main(int x) {
// declare object of class Fibonacci
   Fibonacci fib;
   return fib.getFibonacciNumber(x);

 }

 // You can include R code blocks in C++ files processed with sourceCpp
 // (useful for testing and development). The R code will be automatically
 // run after the compilation.
 //

 /*** R
 fibonacci_main(5)
 */
