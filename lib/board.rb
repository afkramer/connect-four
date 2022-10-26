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
    horizontal_win? || vertical_win? || diagonal_down_win? || diagonal_up_win?
  end

  private

  def horizontal_win?
    win = false
    @board.each do |row|
      win = winning_pattern_match?(row) if winning_pattern_match?(row)
    end
    win
  end

  def vertical_win?
    win = false
    @board.transpose.each do |col|
      win = winning_pattern_match?(col) if winning_pattern_match?(col)
    end
    win
  end

  def diagonal_down_win?
    win = false
    (0...HEIGHT - (NUMBER_TO_CONNECT - 1)).each do |row|
      (0...WIDTH - (NUMBER_TO_CONNECT - 1)).each do |col|
        four_to_check = [@board[row][col], @board[row + 1][col + 1], @board[row + 2][col + 2], @board[row + 3][col + 3]]
        win = winning_pattern_match?(four_to_check) if winning_pattern_match?(four_to_check)
      end
    end
    win
  end

  def diagonal_up_win?
    win = false
    ((HEIGHT - NUMBER_TO_CONNECT)...(HEIGHT - 1)).to_a.reverse.each do |row|
      (0...WIDTH - (NUMBER_TO_CONNECT - 1)).each do |col|
        four_to_check = [@board[row][col], @board[row - 1][col + 1], @board[row - 2][col + 2], @board[row - 3][col + 3]]
        win = winning_pattern_match?(four_to_check) if winning_pattern_match?(four_to_check)
      end
    end
    win
  end

  def winning_pattern_match?(pattern_to_match)
    case pattern_to_match
    in [*_, PIECE1, PIECE1, PIECE1, PIECE1, *_] | [*_, PIECE2, PIECE2, PIECE2, PIECE2, *_]
      true
    else
    end
  end
end

pur = "\u2652"
  yel = "\u264c"
board_setup = [[' ', ' ', ' ', ' ', ' ', ' ', ' '],
                     [' ', ' ', ' ', ' ', ' ', ' ', yel],
                     [' ', ' ', ' ', ' ', ' ', yel, pur],
                     [' ', ' ', ' ', ' ', yel, pur, pur],
                     [' ', ' ', pur, yel, yel, yel, pur],
                     [pur, yel, pur, pur, pur, yel, yel]]

board = Board.new(board_setup)
puts board.winner?
