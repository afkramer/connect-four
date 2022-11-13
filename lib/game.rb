# frozen_string_literal: true

require_relative 'board'

class Game
  def initialize
    @board = Board.new
  end

  def valid_input?(input)
    input.instance_of?(Integer) && input.positive? && input <= Board::WIDTH
  end
end
