class Game
  @player1
  @player2
  @board
  def initialize
    @player1 = Player.new("X")
    @player2 = Player.new("O")
    @board = Board.new
  end
  def play
    puts @board.winner
    until @board.is_full? || @board.winner != "nobody"
      @board.draw
      until @board.place_marc(@player1.choose_play,"X")
      end
      until @board.place_marc(@player2.choose_play,"O")
      end
    end
    puts "Winner is #{@board.winner}"
  end
end

class Player
  @name
  @marc
  def initialize(marc)
    puts "Hi player playing '#{marc}', what's your name? "
    @name = gets.chomp
    @marc = marc
  end
  def choose_play
    while 1 
      puts "#{@name}, where are you putting your #{@marc} (Format: 'Column Row')? "
      begin
        values = parse_play(gets.chomp)
      rescue
        puts "Erroneous input! Try again..."
      else
        return (values)
      end
    end
  end
  
  private
  def parse_play (play)
    values = play.split().map(&:to_i)
    unless values.length() == 2 && values[0].between?(1,MATRIX_SIZE) && values[1].between?(1,MATRIX_SIZE)
      raise "Bad input"
    else
      return values
    end
  end
end

class Board
  @matrix 
  def initialize
    @matrix = [
      ["*","*","*"],
      ["*","*","*"],
      ["*","*","*"]
    ]
  end
  def draw
    @matrix.each do |item|
      puts item.join
    end
  end
  def is_full?
    @matrix.reduce(true) do |_, row|
      break false if row.any? { |s| s == "*" }
      true
    end
  end
  def winner
    winner_marc = "nobody"
    if @matrix[0][0] == @matrix[0][1] && @matrix[0][0] == @matrix[0][2] && @matrix[0][0] != "*"
      winner_marc = @matrix[0][0]
    end
    if @matrix[1][0] == @matrix[1][1] && @matrix[1][0] == @matrix[1][2] && @matrix[1][0] != "*"
      winner_marc = @matrix[1][0]
    end
    if @matrix[2][0] == @matrix[2][1] && @matrix[2][0] == @matrix[2][2] && @matrix[2][0] != "*"
      winner_marc = @matrix[2][0]
    end
    if @matrix[0][0] == @matrix[1][0] && @matrix[0][0] == @matrix[2][0] && @matrix[0][0] != "*"
      winner_marc = @matrix[0][0]
    end
    if @matrix[0][1] == @matrix[1][1] && @matrix[0][1] == @matrix[2][1] && @matrix[0][1] != "*"
      winner_marc = @matrix[0][1]
    end
    if @matrix[0][2] == @matrix[1][2] && @matrix[0][2] == @matrix[2][2] && @matrix[0][2] != "*"
      winner_marc = @matrix[0][2]
    end
    if @matrix[0][0] == @matrix[1][1] && @matrix[0][0] == @matrix[2][2] && @matrix[0][0] != "*"
      winner_marc = @matrix[0][0]
    end
    if @matrix[0][2] == @matrix[1][1] && @matrix[0][0] == @matrix[2][0] && @matrix[0][2] != "*"
      winner_marc = @matrix[0][0]
    end
    return winner_marc
  end
  def place_marc (play, marc)
    if @matrix[play[0]-1][play[1]-1] == "*"
      @matrix[play[0]-1][play[1]-1] = marc
      return true
    else
      puts "PLACE TAKEN!"
      return false
    end
  end
end

MATRIX_SIZE=3 

my_game = Game.new
my_game.play
