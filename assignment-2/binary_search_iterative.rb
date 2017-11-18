def binary_iterative_search(collection, value)
    low = 0
    high = collection.size - 1
    while low <= high
        mid = ((low + high)/2).floor
        if collection[mid] > value
            high = mid -1
        elsif collection[mid] < value
            low = mid + 1
        else
            return collection[mid]
        end
    end
    return "Not Found"
end