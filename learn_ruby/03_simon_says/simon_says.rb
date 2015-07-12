def echo(input)
  input
end

def shout(input)
  input.upcase
end

def repeat(input, how_many=2)
  result = ""
  how_many.times{result.empty? ? result += "#{input}" : result += " #{input}"} 
  result
end

def start_of_word(word, index)
  word[0...index]
  
end

def first_word(words)
  words.split(' ')[0]
  
end

def titleize(words)
  little_words = ['and','the', 'over']
  first_word = 0
  c = words.split(' ')
  c[0].capitalize!
  c[-1].capitalize!
  c = c.collect do |word|
    if little_words.include?(word) 
      word
    else
      word.capitalize
    end 
  end
  c.join(' ')
end



