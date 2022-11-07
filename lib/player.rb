# frozen_string_literal: true

class Player
  attr_reader :has_turn

  def initialize(name, token)
    @name = name
    @token = token
    @has_turn = token == "\u2652"
  end

  def switch_turn
    @has_turn = !@has_turn
  end
end
