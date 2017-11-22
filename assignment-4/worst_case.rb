def worst_case(n)
    count = 1 
    while count <= n
    puts "array of size: #{count}"
    puts "worst case: #{count}"
    count += 1
    end
end

worst_case(10)