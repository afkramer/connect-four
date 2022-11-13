# frozen_string_literal: true

class Player
  attr_reader :has_turn

  def initialize(token, name = nil)
    @token = token
    @name = name || assign_name
    @has_turn = token == "\u2652"
  end

  def assign_name
    # Start here
    # Create a method in the Gui that gets a name
    # Make sure it's not blank
  end

  def switch_turn
    @has_turn = !@has_turn
  end
end
