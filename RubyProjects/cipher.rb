## project#1 from the odin project Ruby building blocks section

def caesar_cipher(string, shift_factor)
  lower_alphabet = ("a".."z").to_a
  capitalized_letters = ("A".."Z").to_a
  lower_alphabet = lower_alphabet + lower_alphabet
  capitalized_letters = capitalized_letters + capitalized_letters
  string = string.split('')
  new_string = []
  string.each do |letter|
    if lower_alphabet.include?(letter)
      new_string << lower_alphabet[lower_alphabet.index(letter) + shift_factor]
    elsif capitalized_letters.include?(letter)
      new_string << capitalized_letters[capitalized_letters.index(letter) + shift_factor]
    else
      new_string << letter
    end
  end
    new_string.join('')
end

puts caesar_cipher("What a string!", 5)
puts caesar_cipher('Bmfy f xywnsl!', -5)