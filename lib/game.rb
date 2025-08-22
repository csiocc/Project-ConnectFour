require_relative 'board'

class Game
  attr_reader :player_one, :player_two, :game_over

  def initialize(player_one = nil, player_two = nil)
    @player_one = player_one
    @player_two = player_two
    @game_over = false
  end

  def valid_input?(input)
    return false if input.nil?
    return true if input.to_i >= 0 && input.to_i <= 6

    false
  end

  def player_input
    loop do
      input = gets.chomp
      input.to_i
      return input.to_i if valid_input?(input)
    end
  end

  def game_over_row?(row, play)
  end
end

play = Board.new
play.setup
# game = Game.new
# p game.game_over_row?(0, play)
