# frozen_string_literal: true

require_relative '../lib/game'

describe Game do
  describe '#valid_input?' do
    context 'player inputs a number between 1 and WIDTH' do
      subject(:valid_game_input) { described_class.new }
      it 'returns true' do
        valid_input = 5
        expect(valid_game_input.valid_input?(valid_input)).to be true
      end
    end
  end
end
