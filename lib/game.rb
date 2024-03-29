# frozen_string_literal: true

require_relative '../lib/board'
require_relative '../lib/player'

# All methods for playing a game of Connect 4
class Game
  attr_reader :active_player

  def initialize(player1 = nil, player2 = nil)
    @first_game = true
    @board = Board.new
    @gui = Gui.new
    @player1 = player1 || Player.new(Board::PIECE1, 1)
    @player2 = player2 || Player.new(Board::PIECE2, 2)
    @active_player = @player1
  end

  def play_game
    if @first_game
      @gui.start_game
      set_up_players
      @first_game = false
    end

    loop do
      take_turn
      break if @board.winner? || @board.stalemate?

      switch_active_players
    end
    end_game
  end

  def set_up_players
    @player1.assign_name
    @player2.assign_name
  end

  def take_turn
    @gui.display_board(@board.board)
    chosen_column = @gui.get_desired_column(@active_player.name).to_i
    until valid_input?(chosen_column)
      @gui.display_invalid_input
      @gui.display_board(@board.board)
      chosen_column = @gui.get_desired_column(@active_player.name).to_i
    end
    @board.drop_token(chosen_column, @active_player.token)
  end

  def end_game
    @gui.display_board(@board.board)
    @board.winner? ? @gui.display_winner(@active_player.name) : @gui.display_stalemate
    play_again
  end

  def play_again
    if @gui.get_play_again.downcase == 'y'
      @board = Board.new
      switch_active_players
      play_game
    else
      @gui.display_thanks_for_playing
    end
  end

  def valid_input?(input)
    input.instance_of?(Integer) && input.positive? && input <= Board::WIDTH && @board.drop_possible?(input)
  end

  def switch_active_players
    @active_player =  if @active_player == @player1
                        @player2
                      else
                        @player1
                      end
  end
end
