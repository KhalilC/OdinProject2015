# hangman

def get_player_guess
  lower_case_letters = ('a'..'z')
  valid_guesses = lower_case_letters.to_a
  begin
  puts "Enter a guess: "
  guess = gets.chomp.downcase
  if !valid_guesses.include?(guess)
    puts "Not a valid choice.  Only letters please!"
  end
  end until valid_guesses.include?(guess)
  guess
end


def retrieve_word(file)
dictionary = File.read(file)
good_words = dictionary.split.select{|words| words.length >= 5 && words.length <= 12 }
good_words.sample
end

def draw_board(word)
  "-" * word.length
end

# pass in board, player_guess, the word to the function
# check to see if word contains player_guess
#if yes update the board else return the board as is

def check_player_guess(guess, letter_tracker)
  letter_tracker.has_value?(guess)
end

def update_board(guess, letter_tracker, board)
  return board unless check_player_guess(guess, letter_tracker)
  letter_tracker.each do |key, value|
    if guess == value
      board[key] = guess
    end
  end
  board
end

#word = retrieve_word("5desk.txt")
#word_to_array = word.split("")
#letter_tracker = {}
#word_to_array.each_with_index {|letter, index| letter_tracker[index] = letter}
#board = draw_board(word)
#p letter_tracker
#player enters a guess
#check to see if word contains guess _ _ _
## 
system 'clear'
word = "khalil"
word_to_array = word.split("")
letter_tracker = {}
word_to_array.each_with_index {|letter, index| letter_tracker[index] = letter}
board = draw_board(word)
puts
puts board
puts
guess = get_player_guess
if check_player_guess(guess, letter_tracker)
  puts update_board(guess, letter_tracker, board)
else
  puts board
end













