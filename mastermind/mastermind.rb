class Game
  @code_breaker
  @code_setter
  @board
  @code
  @current_round
  @code_broken
  def initialize
    @code_breaker = Code_Breaker.new()
    @code_setter = Code_Setter.new()
    @code = @code_setter.choose_code
    @board = Board.new (@code)
    @current_round = 1
    @code_broken = false
  end
  def play
    while (@current_round <= ROUNDS) && (@code_broken == false)
      #@code_broken = board.checkCode(Code_Breaker.guess_code)
      @code_broken = @board.checkCode(@code_breaker.choose_code, @current_round)
      @board.draw(@current_round)
      @current_round = @current_round + 1
    end
  end
  def announce_winner
    if @code_broken
      puts ("THE CODE HAVE BEEN BROKEN!")
    else
      puts ("Code is secure. Try again")
    end
  end
end

module Player
  @name
  def set_name(role)
    puts "Hi player playing #{role} what's your name? "
    @name = gets.chomp
  end

  def choose_code ()
    while 1 
      puts "#{@name}, which is the SECRET CODE? Format 'A B C D'"
      begin
        code = parse_play(gets.chomp)
      rescue
        puts "Erroneous input! Try again..."
      else
        return (code)
      end
    end
  end
  private
  def parse_play (code)
    values = code.split
    puts "#{values} #{values.length}"
    if values.length == 4 && values.all? { |code_char| POSIBLE_CODE_VALUES.any? { |n| code_char == n }}
      return values
    else
      raise "Bad input"
    end
  end
end

class Code_Breaker
  include Player
  def initialize ()
    @name = set_name("code breaker")
  end
end

class Code_Setter
  include Player
  def initialize ()
    @name = set_name("code setter")
  end

end
class Board
  @code
  @guesses 
  @hints

  def initialize(code)
    @code=code
    @guesses = []
    @hints = []
  end
  def draw(current_round)
    for i in 0..current_round-1
      puts "Guess: #{@guesses[i]}"
      puts "Hint: #{@hints[i]}"
    end
  end
  def checkCode(guess, current_round)
    is_broken = false
    puts "Round #{current_round}"
    @guesses.insert(current_round-1, guess)
    @hints.insert(current_round-1,calculate_hint(guess))
    if guess == @code
      is_broken = true
    else
      is_broken = false
    end
  end

  private
  def calculate_hint(guess)
    hint=guess.each_with_index.map do |x,i|
      if x == @code[i]
        "RED"
      elsif @code.any? { |n| x == n }
        "WHITE"
      else 
        "NONE"
      end
    end
  end
end

ROUNDS = 12
POSIBLE_CODE_VALUES = ["A", "B", "C", "D"]

my_game = Game.new
my_game.play
my_game.announce_winner
