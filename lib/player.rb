# frozen_string_literal: true

require_relative 'gui'

class Player
  attr_reader :has_turn, :name

  def initialize(token, number, name = nil)
    @gui = Gui.new
    @token = token
    @number = number
    @name = name
    @has_turn = token == "\u2652"
  end

  def assign_name
    loop do
      name = @gui.get_player_name(@number, @token)
      return name if valid_name?(name)

      @gui.display_invalid_input
    end
  end

  def valid_name?(name)
    name != ''
  end

  def switch_turn
    @has_turn = !@has_turn
  end
end
