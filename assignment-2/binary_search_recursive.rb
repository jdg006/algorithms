def binary_recursive_search(collection, value, low, high)
    mid = ((low + high)/2).floor
    if collection[mid] > value
        high = mid - 1
        return binary_recursive_search(collection, value, low, high)
    elsif collection[mid] < value
        low = mid + 1
        return binary_recursive_search(collection, value, low, high)
    else
        return collection[mid]
    end
    return "Not Found"
end