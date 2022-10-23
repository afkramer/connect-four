# frozen_string_literal: true

class Board
  HEIGHT = 6
  WIDTH = 7
  NUMBER_TO_CONNECT = 4
  PIECE1 = "\u2652"
  PIECE2 = "\u264c"

  def initialize(board = nil)
    @board = board || Array.new(HEIGHT) { Array.new(WIDTH, ' ') }
  end

  def winner?
    horizontal_win? || vertical_win? || diagonal_down_win?
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

  def diagonal_down_win?
    win = false
    (0...HEIGHT - (NUMBER_TO_CONNECT - 1)).each do |row|
      (0...WIDTH - (NUMBER_TO_CONNECT - 1)).each do |col|
        four_to_check = [@board[row][col], @board[row + 1][col + 1], @board[row + 2][col + 2], @board[row + 3][col + 3]]
        case four_to_check
        in [*_, PIECE1, PIECE1, PIECE1, PIECE1, *_] | [*_, PIECE2, PIECE2, PIECE2, PIECE2, *_]
          win = true
        else
        end
      end
    end
    win
  end
end
