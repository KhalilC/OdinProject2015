# hangman
require 'yaml'

class Hangman
  attr_accessor :word, :incorrect_letters, :hidden_word, :index_tracker, :incorrect_guesses, :all_input
  def initialize(file)
    @word = retrieve_word(file)
    @incorrect_letters = []
    @hidden_word = "-" * @word.length
    @index_tracker = {}
    @incorrect_guesses = 6
    @all_letters = []
  end

  def get_player_guess
    lower_case_letters = ('a'..'z')
    valid_guesses = lower_case_letters.to_a
    begin
    puts "Enter a guess(or 'save' to save current game): "
    guess = gets.chomp.downcase
    return 'save' if guess == 'save'

    if !valid_guesses.include?(guess)
      puts "Not a valid choice.  Only letters please!"
    elsif @all_letters.include?(guess)
      puts "Letter already used.  Try again!"
    end
    end until valid_guesses.include?(guess) && !@all_letters.include?(guess)
    @all_letters << guess
    guess
  end

  def intro
    puts "Welcome to Hangman!  You're allowed 5 incorrect guesses.  On the 6th you lose!"
    puts
  end

  def retrieve_word(file)
  dictionary = File.read(file)
  good_words = dictionary.split.select{|words| words.length >= 5 && words.length <= 12 }
  good_words.sample
  end

  def display
    puts "Incorrect letters used: #{incorrect_letters}.  Incorrect guesses left: #{incorrect_guesses}  "
    puts
    @hidden_word.split('').each {|letter| print letter}
    puts
  end

  def check_player_guess(guess)
    if @index_tracker.has_value?(guess)
      return true
    else
      @incorrect_letters << guess
      @incorrect_guesses -= 1
      return false
    end
  end

  def update_display(guess)
    return @hidden_word unless check_player_guess(guess)
    @index_tracker.each do |key, value|
      if guess == value
        @hidden_word[key] = guess
      end
    end
    hidden_word
  end

  def update_index_tracker
    @word.downcase.split("").each_with_index{|letter, index| @index_tracker[index] = letter }
  end

  def result
    if @hidden_word == @word
      system 'clear'
      display
      puts "Congrats you win!"
      return true
    elsif @incorrect_guesses == 0
      system 'clear'
      display
      puts "Sorry, you lose!  The answer was: #{word}."
      return true
    end
    nil
  end

  def run
    update_index_tracker
    begin
    system 'clear'
    display
    guess = get_player_guess
    if guess == 'save'
      save_game
      break
    end
    update_display(guess)
    end until result || @incorrect_guesses == 0
  end
end

def save_game
  Dir.mkdir('games') unless Dir.exist? 'games'
  @filename = 'games/saved_game.yaml'
  File.open(@filename, 'w') do |file|
    file.puts YAML.dump(self)
  end
  puts "Your game has been saved as #{@filename}"
  exit
end

def load_game
  content = File.open('games/saved_game.yaml', 'r') {|file| file.read }
  YAML.load(content)
end


puts "\nWelcome to Hangman.\n"
puts "You can save a game at anytime by entering SAVE"
puts "Enter NEW to start a new game or OPEN to open a saved game."
response = gets.chomp

if response.upcase == "OPEN"
  game = load_game
elsif response.upcase == "NEW"
  game = Hangman.new("5desk.txt")
end

game.run















