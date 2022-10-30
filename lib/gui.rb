# frozen_string_literal: false

require_relative 'board'

class Gui
  def display_board(board)
    board.each do |row|
      line = '|'
      row.each do |space|
        line << " #{space} |"
      end
      puts line
      puts "#{'-----' * row.length}-"
    end
  end
end

pur = "\u2652"
yel = "\u264c"
board_setup = [['  ', '  ', '  ', '  ', '  ', '  ', '  '],
               ['  ', pur, pur, '  ', '  ', '  ', '  '],
               ['  ', pur, yel, pur, '  ', '  ', '  '],
               ['  ', yel, yel, pur, '  ', '  ', pur],
               [yel, pur, yel, yel, yel, '  ', yel],
               [yel, pur, pur, pur, yel, pur, pur]]
board = Board.new(board_setup)
gui = Gui.new
gui.display_board(board.board)

