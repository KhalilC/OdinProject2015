def reverser(&block)
  string = block.call
  empty_array = []
  array = string.split(' ')
  array.each do |word|
    empty_array << word.reverse
  end
  empty_array.join(' ')

end

def adder(default=0, &block)
  number = block.call
  if default == 0
    number += 1
  else
    number += default
  end
  number

end

def repeater(number=1, &block)
  number.times {block.call}
end


