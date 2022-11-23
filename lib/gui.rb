# frozen_string_literal: false

require_relative 'board'

class Gui
  def get_player_name(player_number, token)
    puts "\nPlayer #{player_number}, you will play as #{token}."
    puts "Please enter your name.\n\n"
    gets.chomp
  end

  def display_invalid_input
    puts "\nSorry, that's invalid input. Try again."
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

  def get_desired_column(name)
    puts "\n#{name}, please choose a column to drop your token.\n\n"
    gets.chomp
  end

  def display_winner(name)
    puts "\nCongratulations, #{name}! You won!"
  end

  def display_stalemate
    puts "\nIt's a draw! Better luck next time."
  end

  def get_play_again
    puts "\nWould you like to play again? Type 'y' to play again or any other key to quit.\n\n"
    gets.chomp
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
