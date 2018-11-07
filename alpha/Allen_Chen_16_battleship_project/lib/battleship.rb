require_relative "board"
require_relative "player"

class Battleship
  attr_reader :board, :player

  def initialize(n)
    @player = Player.new()
    @board = Board.new(n)
    @remaining_misses = @board.size/2.0
  end

  def start_game
    @board.place_random_ships
    puts "There are #{@board.num_ships} ships left on the board"
    @board.print
  end

  def lose?
    if @remaining_misses <= 0
      puts "you lose!"
      return true
    else
      return false
    end
  end

  def win?
    if @board.num_ships == 0
      puts "you win!"
      return true
    else
      return false
    end
  end

  def game_over?
    self.lose? || self.win?
  end

  def turn
    if !@board.attack(@player.get_move)
      @remaining_misses -= 1
    end
    @board.print
    puts "You have #{@remaining_misses} shots left"
  end
end