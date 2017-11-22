require 'benchmark'
require_relative 'collection'
    
  collection = Collection.new
  
  array = []
  50.times do |i|
      array.push(i + rand(100))
  end
  
  array1 = []
  array1.replace(array)
  
  
  
 
  puts "Heap Sort: #{Benchmark.measure {collection.heap_sort(array1)}}"
  puts "Bucket Sort: #{Benchmark.measure {collection.bucket_sort(array)}}"
  puts "Quick Sort: #{Benchmark.measure {collection.quick_sort(array)}}"
  puts "Selection Sort: #{Benchmark.measure {collection.quick_sort(array)}}"
    
 
  