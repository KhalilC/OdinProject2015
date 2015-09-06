# object oriented tic tac toe for human vs human

class Player
  attr_accessor :name
  def initialize(name)
    @name = name 
  end
end

class Human < Player
  attr_accessor :marker
  def initialize(name)
    super
    @marker = ""
  end
end

class Board
  attr_accessor :data
  def initialize
    @data = {}
    (1..9).each {|position| @data[position] = ' '}
  end
  def draw
    system 'clear'
    puts
    puts "       |       |"
    puts " #{@data[1]}     |  #{@data[2]}    |   #{@data[3]}"
    puts "       |       |"
    puts "-------+-------+------"
    puts "       |       |"
    puts " #{@data[4]}     |  #{@data[5]}    |   #{@data[6]}"
    puts "       |       |"
    puts "-------+-------+------"
    puts "       |       |"
    puts " #{@data[7]}     |  #{@data[8]}    |   #{@data[9]}"
    puts "       |       |"
    puts
  end
end

class TicTacToe
  attr_accessor :new_player, :new_player2, :computer, :board, :all_squares
  def initialize
    @new_player = Human.new("default")
    @new_player2 = Human.new("default")
    @board = Board.new
    @all_squares = [1,2,3,4,5,6,7,8,9]
  end

  def intro
    puts "Welcome to Tic Tac Toe"
    puts "Square are from 1-9"
    puts "Please enter the first player's name"
    @new_player.name = gets.chomp
    @new_player.marker = "X"
    puts "Please enter the second player's name"
    @new_player2.name = gets.chomp
    @new_player2.marker = "O"
  end

  def pick_a_square(player)
    return if check_winner(@board.data)
    begin
    puts "Please pick a square(1-9)"
    choice = gets.chomp.to_i
    end until @all_squares.include?(choice)
    @board.data[choice] = player.marker
    @all_squares.delete(choice)
   
  end

  def check_winner(board)
    winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
    winning_lines.each do |line|
      
      return @new_player.name if board.values_at(*line).count('X') == 3
      return @new_player2.name if board.values_at(*line).count('O') == 3
    end
    nil
  end

  def run
    intro
    begin
    @board.draw
    pick_a_square(@new_player)
    @board.draw
    pick_a_square(@new_player2)  
    end until check_winner(@board.data) || @all_squares.empty?
    @board.draw
    if check_winner(@board.data)
      puts "#{check_winner(@board.data)} won!"
    else
      puts "It's a tie!"
    end
  end

end

game = TicTacToe.new
game.run
