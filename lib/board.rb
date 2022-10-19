# frozen_string_literal: true

class Board
  HEIGHT = 6
  WIDTH = 7
  PIECE1 = "\u2652"
  PIECE2 = "\u264c"

  def initialize(board = nil)
    @board = board || Array.new(HEIGHT) { Array.new(WIDTH, ' ') }
  end

  def winner?
    horizontal_win? || vertical_win?
  end

  private

  def horizontal_win?
    win = false
    @board.each do |row|
      case row
      in [*_, PIECE1, PIECE1, PIECE1, PIECE1, *_] | [*_, PIECE2, PIECE2, PIECE2, PIECE2, *_]
        win = true
      else
      end
    end
    win
  end

  def vertical_win?
    win = false
    @board.transpose.each do |col|
      case col
      in [*_, PIECE1, PIECE1, PIECE1, PIECE1, *_] | [*_, PIECE2, PIECE2, PIECE2, PIECE2, *_]
        win = true
      else
      end
    end
    win
  end
end
