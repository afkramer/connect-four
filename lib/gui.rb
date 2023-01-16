# frozen_string_literal: false

require_relative '../lib/board'

class Gui
  def start_game
    puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
    puts 'Welcome to Connect 4!'
  end
  
  def get_player_name(player_number, token)
    puts "\nPlayer #{player_number}, you will play as #{token}."
    puts "Please enter your name.\n\n"
    gets.chomp
  end

  def display_invalid_input
    puts "\nSorry, that's invalid input. Try again."
    sleep 2
  end

  def display_board(board)
    puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
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
    sleep 2
  end

  def display_stalemate
    puts "\nIt's a draw! Better luck next time."
    sleep 2
  end

  def get_play_again
    puts "\nWould you like to play again? Type 'y' to play again or any other key to quit.\n\n"
    gets.chomp
  end

  def display_thanks_for_playing
    puts "\nThanks for playing!\n\n\n"
    sleep 2
  end
end
