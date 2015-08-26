#substrings

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(words, dictionary)
  count_tracker = Hash.new(0)
  array_of_words = words.split(' ')
  array_of_words.each do |word|
    dictionary.each do |dictionary_word|
      if word.downcase.include?(dictionary_word)
        count_tracker[dictionary_word] += 1
      end
    end
  end
  p count_tracker
end

substrings("Howdy partner, sit down! How's it going?", dictionary)