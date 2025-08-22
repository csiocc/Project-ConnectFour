require_relative 'board'
require_relative 'player'

class Game
  attr_reader :player_one, :player_two, :game_over

  def initialize(player_one = nil, player_two = nil)
    @player_one = Player.new(:player_one, :red)
    @player_two = Player.new(:player_two, :yellow)
    @game_over = false
    @game = Board.new
  end

  def valid_input?(input)
    return false if input.nil?
    return true if input.to_i >= 0 && input.to_i < 7

    false
  end

  def player_input
    loop do
      p 'insert a valid input please'
      input = gets.chomp
      input.to_i
      return input.to_i if valid_input?(input) && !@game.column_full?(input.to_i)
    end
  end

  def setup
    @game.setup
  end

  def game_over?
    return true if @game.four_row?(@player_one.color)
    return true if @game.four_row?(@player_two.color)
    return true if @game.four_column?(@player_one.color)
    return true if @game.four_column?(@player_two.color)
    return true if @game.four_diagonal?(@player_one.color)
    return true if @game.four_diagonal?(@player_two.color)

    false
  end

  def play
    loop do
      @game.render
      p 'Player 1 Turn'
      input_player_one = player_input
      @game.place(input_player_one, @player_one.color)
      @game.render
      return p 'Player 1 wins' if game_over?

      @game.render
      p 'Player 2 Turn'
      input_player_two = player_input
      @game.place(input_player_two, @player_two.color)
      @game.render
      return p 'Player 2 wins' if game_over?
    end
  end
end
