class Book
  


  def title=(title)
    no_caps = ['and', 'the', 'of', 'in', 'a', 'an']
    title_array = title.split(' ')
    new_array = []
    count = 0
    title_array.each do |word|
      if count == 0 || !no_caps.include?(word)
        new_array << word.capitalize
      else
        new_array << word
      end
      count += 1
    end
    @title = new_array.join(' ')
  end

  def title
    @title
  end

end
