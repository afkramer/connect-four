# frozen_string_literal: true

class Board
  HEIGHT = 6
  WIDTH = 7
  NUMBER_TO_CONNECT = 4
  PIECE1 = "\u2652"
  PIECE2 = "\u264c"
  PIECES = [PIECE1, PIECE2].freeze
  EMPTY_SPOT = '  '

  attr_reader :board

  def initialize(board = nil)
    @board = board || Array.new(HEIGHT) { Array.new(WIDTH, EMPTY_SPOT) }
  end

  # column is from user input (index starts at 1)
  def drop_possible?(column)
    first_space = first_free_space(column - 1)
    first_space.instance_of?(Integer)
  end

  # column is from user input (index starts at 1)
  def drop_token(column, token)
    target_row = first_free_space(column - 1)

    @board[target_row][column - 1] = token unless target_row.nil?
  end

  def winner?
    horizontal_win? || vertical_win? || diagonal_down_win? || diagonal_up_win?
  end

  def stalemate?
    @board.flatten.none?(EMPTY_SPOT) && !winner?
  end

  private

  # expects column using index starting at 0
  def first_free_space(column)
    min_positions = []
    PIECES.each do |piece|
      min_positions << @board.transpose[column].index(piece) unless @board.transpose[column].index(piece).nil?
    end

    if min_positions.empty?
      HEIGHT - 1
    elsif min_positions.min.positive?
      min_positions.min - 1
    end
  end

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
        win = winning_pattern_match?(four_to_check)
        break if win
      end
      break if win
    end
    win
  end

  def diagonal_up_win?
    win = false
    ((HEIGHT - (NUMBER_TO_CONNECT - 1))...HEIGHT).to_a.reverse.each do |row|
      (0...WIDTH - (NUMBER_TO_CONNECT - 1)).each do |col|
        four_to_check = [@board[row][col], @board[row - 1][col + 1], @board[row - 2][col + 2], @board[row - 3][col + 3]]
        win = winning_pattern_match?(four_to_check)
        break if win
      end
      break if win
    end
    win
  end

  def winning_pattern_match?(pattern_to_match)
    case pattern_to_match
    in [*_, PIECE1, PIECE1, PIECE1, PIECE1, *_] | [*_, PIECE2, PIECE2, PIECE2, PIECE2, *_]
      true
    else
      false
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
