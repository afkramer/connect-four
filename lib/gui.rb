# frozen_string_literal: false

require_relative 'board'

class Gui
  def get_player_name(player_number, token)
    puts "\nPlayer #{player_number}, you will play as #{token}."
    puts "Please enter your name.\n\n"
    gets.chomp
  end

  def display_board(board)
    starting_row = "\n"
    (1..board[1].length).each { |num| starting_row << "  #{num}  " }
    puts starting_row
    puts
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
#board = Board.new(board_setup)
gui = Gui.new
#gui.display_board(board.board)
gui.get_player_name(1, pur)
