# object oriented tic tac toe

class Player
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

class Human < Player
  attr_reader :marker
  def initialize(name)
    super
    @marker = "X"
  end
end

class Computer < Player
  attr_reader :marker
  def initialize(name)
    super
    @marker = "O"
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
  attr_accessor :new_player, :computer, :board, :all_squares
  def initialize
    @new_player = Human.new("Khalil")
    @computer = Computer.new("Computer")
    @board = Board.new
    @all_squares = [1,2,3,4,5,6,7,8,9]
  end

  def pick_a_square
    begin
    puts "Please pick a square(1-9)"
    choice = gets.chomp.to_i
    end until @all_squares.include?(choice)
    @board.data[choice] = @new_player.marker
    @all_squares.delete(choice)
   
  end

  def computer_pick
    if @all_squares.empty?
      return
    else
      computer_choice = @all_squares.sample
      @board.data[computer_choice] = @computer.marker
      @all_squares.delete(computer_choice)
    end
  end

  def check_winner(board)
    winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
    winning_lines.each do |line|
      
      return "Player" if board.values_at(*line).count('X') == 3
      return "Computer" if board.values_at(*line).count('O') == 3
    end
    nil
  end

  def run
    begin
    @board.draw
    pick_a_square
    computer_pick
    @board.draw
    end until check_winner(@board.data) || @all_squares.empty?
    if check_winner(@board.data)
      puts "#{check_winner(@board.data)} won!"
    else
      puts "It's a tie!"
    end
  end



end

game = TicTacToe.new
game.run




