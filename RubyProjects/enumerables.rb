# implementing my own versions of each method

module Enumerable 
    def my_each
        return self unless block_given?
        for i in self
            yield(i)
        end
    end

    def my_each_with_index
      return self unless block_given?
      for i in 0...length
        yield(self[i], i)
      end
    end

    def my_select
      return_array = []
      return self unless block_given?
      for i in self
        if yield(i)
          return_array << i
        end
      end
        return_array
    end

    def my_all?
      return true unless block_given?
      for i in self
        if !yield(i)
          return false
        end
      end
      true
    end

    def my_any?
      return true unless block_given?
      for i in self
        if yield(i)
          return true
        end
      end
      false
    end

    def my_none?
      return true if self.empty?
      return true unless block_given?
      for i in self
        return false if yield(i)
      end
      true
    end

    def my_count
      counter = 0
      if block_given?
        self.my_each {|i| yield(i) ? counter += 1 : counter += 0}
      else
        self.my_each{|i| counter += 1}
      end
      counter
    end

    def my_map
      return self unless block_given?
      new_array = []
      self.my_each{|i| new_array << yield(i)}
      new_array
    end

    def my_map2
      return self unless proc
      new_array = []
      self.my_each { |i| new_array << proc.call(i)}
      new_array
    end

    def my_inject(initial = nil)
      total = initial.nil? ? self.first : initial
      range = initial.nil? ? self.my_count - 1 : self.my_count
      for item in self.last(range)
        total = yield(total, item)
      end
      return total
    end

    def multiply_els(array)
      array.my_inject(1) {|sum, n| sum * n }
    end

end











