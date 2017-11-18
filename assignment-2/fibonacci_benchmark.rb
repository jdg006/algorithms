require "benchmark"

def fib_recursive(n)
   if (n == 0)
     return 0
   elsif (n == 1)
     return 1
   else
     return fib_recursive(n-1) + fib_recursive(n-2)
   end
 end
 
  def fib_iterative(n)
    return 0 if n == 0
    fib_0 = 0
    fib_1 = 1
    count = 0
    while count < n-1
        temp = fib_0
        fib_0 = fib_1
        fib_1 = temp + fib_1
        count += 1
    end
    return fib_1
 end
 
 puts Benchmark.measure {fib_iterative(20)}
 puts Benchmark.measure {fib_recursive(20)} 