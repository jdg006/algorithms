class Collection
  
  def initialize
  end
  
def quick_sort(array)
    if array == []
      return nil
    elsif array.size == 1 
      return array
    end
      
    pivot = array.slice!(-1)
    sorted_array = []
    left_sub_array = []
    right_sub_array = []
    equal_to_pivot = []
      
    array.each do |x|
      if x > pivot
        right_sub_array.push(x)
      elsif x < pivot
        left_sub_array.push(x)
      else
        equal_to_pivot.push(x)
      end
    end
      
    left = quick_sort(left_sub_array)
    right = quick_sort(right_sub_array)
      
    if left != nil
      left.each do |x|
        sorted_array.push(x)
      end
    end
      
    sorted_array.push(pivot)
      
    if equal_to_pivot != []
      equal_to_pivot.each do |x|
        sorted_array.push(x)
      end
    end
      
    if right != nil
      right.each do |x|
        sorted_array.push(x)
      end
    end
    
    return sorted_array
  end
    
  def heap_sort(array)
    if array.size == 1 
      return array
    end
    
    array.insert(0, nil)
    count = array.size - 1
    while count > 1
      if count % 2 == 0
        parent = count/2
      else
        parent = (count-1)/2
      end
    
    if array[count] > array[parent]
      temp_parent = array[parent]
      temp_child = array[count]
      array[parent] = temp_child
      array[count] = temp_parent
    end
      count -= 1
    end
  
    sorted_array = []
    sorted_array.insert(0, array.slice!(1))
    array.slice!(0)
    sorted_array.insert(0, heap_sort(array))
    
    return sorted_array.flatten
  end
  
  def bucket_sort(array)
  
    bucket_array = []
    highest = array[0]
    lowest = array[0]
    
    array.each do |x|
      highest = x if x > highest
      lowest = x if x < lowest
    end
    
    range = highest - lowest
    
    i = 0
    while i != ((range)+2)
      bucket_array[i] = []
      i += 1
    end
    
    array.each do |x|
      
      if bucket_array[x/2] != nil
      bucket_array[x/2].push(x)
      end
    end
    
    bucket_array.each_with_index do |x, index|
      
      bucket_array[index] = selection_sort(x)
    end
    
    return bucket_array.flatten
  end

  def selection_sort(array)
    if array.size < 2 
      return array
    end
    lowest_index = 0
    sorted_array = []
    array.each_with_index do |x, i|
      if x < array[lowest_index]
        lowest_index = i 
      end
    end
    sorted_array.push(array.slice!(lowest_index))
    sorted_array.push(selection_sort(array))
    return sorted_array.flatten
  end
  
end






