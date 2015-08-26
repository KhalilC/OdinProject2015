def bubble_sort(array_of_numbers)
  begin
    array_of_numbers.each_with_index do |number, index|
      break if index == array_of_numbers.length - 1
      if number > array_of_numbers[index+1]
        array_of_numbers[index], array_of_numbers[index+1] = array_of_numbers[index+1], array_of_numbers[index]
      end
    end
  end until array_of_numbers == array_of_numbers.sort
  p array_of_numbers
end

bubble_sort([4,3,78,2,0,2])


def bubble_sort_by(array)
  begin
    array.each_with_index do |number, index|
      break if index == array.length - 1
      if yield(number, array[index+1]) == 1
        array[index], array[index+1] = array[index+1], array[index]
      end
    end
  end until array == array.sort
  p array
end

bubble_sort_by([4,3,78,2,0,2]) {|number1, number2| number1 <=> number2}
