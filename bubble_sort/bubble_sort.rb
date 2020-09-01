def bubble_sort array
  (00..array.length-1).reverse_each do |num|
    (0..num-1).each do |num2|
      if array[num2] > array[num2+1] 
        array[num2], array[num2+1] = array[num2+1], array[num2]
      end
    end
  end
  array
end

p bubble_sort([4,3,78,2,0,2])
