# frozen_string_literal: true

require_relative 'gui'

class Player
  attr_reader :name

  def initialize(token, number, name = nil)
    @gui = Gui.new
    @token = token
    @number = number
    @name = name
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
end
