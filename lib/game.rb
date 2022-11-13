# frozen_string_literal: true

require_relative 'board'

class Game
  def initialize
    @board = Board.new
    @player1 = nil
    @player2 = nil
  end

  def set_up_players
    @player1 = Player.new(Board::PIECE1)
    @player2 = Player.new(Board::PIECE2)
  end

  def valid_input?(input)
    input.instance_of?(Integer) && input.positive? && input <= Board::WIDTH
  end
end
