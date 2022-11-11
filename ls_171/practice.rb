def oddities(array)
  result = []
    counter = 0
    size = array.size
    while counter <= size -1
      1
      p "index is #{counter} and the element at that index is #{array[counter]}"
      result << array[counter]
      counter += 2
    end
  result
end

p oddities([2, 3, 4, 5, 6]) #== [2, 4, 6]