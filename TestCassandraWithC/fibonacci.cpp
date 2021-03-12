
// Implementation of class Fibonacci
//
// The method int Fibonacci::getFibonacciNumber(int n)
// computes the n-th Fibonacci number recursively.
//
#include "Fibonacci.h"


int Fibonacci::getFibonacciNumber(int n)
  {
   if (n == 0) return 0;
   if (n == 1) return 1;
   return getFibonacciNumber(n-2) + getFibonacciNumber(n-1);
 }
