# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

class Game
  attr_reader :active_player

  def initialize(player1 = nil, player2 = nil)
    @board = Board.new
    @player1 = player1 || Player.new(Board::PIECE1, 1)
    @player2 = player2 || Player.new(Board::PIECE2, 2)
    @active_player = @player1
  end

  def play_game
    set_up_players
    loop do
      take_turn
    end
  end

  def take_turn
  end
  
  def set_up_players
    @player1.assign_name
    @player2.assign_name
  end

  def valid_input?(input)
    input.instance_of?(Integer) && input.positive? && input <= Board::WIDTH
  end

  def switch_active_players
    #@active_player == @player1 ? @active_player = @player2 : @active_player = @player1
    @active_player =  if @active_player == @player1
                        @player2
                      else
                        @player1
                      end
  end
end
