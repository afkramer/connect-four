# frozen_string_literal: true

require_relative '../lib/game'
require_relative '../lib/board'

describe Game do
  describe '#valid_input?' do
    context 'player inputs a number between 1 and WIDTH' do
      subject(:valid_game_input) { described_class.new }
      it 'returns true' do
        valid_input = 5
        expect(valid_game_input.valid_input?(valid_input)).to be true
      end
    end

    context 'player inputs a number less than 1' do
      subject(:game_input_too_low) { described_class.new }
      it 'returns false' do
        invalid_input = -1
        expect(game_input_too_low.valid_input?(invalid_input)).to be false
      end
    end

    context 'player inputs a number higher than width of board' do
      subject(:game_input_too_high) { described_class.new }
      it 'returns false' do
        invalid_input = Board::WIDTH + 1
        expect(game_input_too_high.valid_input?(invalid_input)).to be false
      end
    end

    # This test case won't happen -> the input is converted to an int, so words become 0
    context 'player inputs a word' do
      subject(:game_word_input) { described_class.new }
      it 'returns false' do
        invalid_input = 'one'
        expect(game_word_input.valid_input?(invalid_input)).to be false
      end
    end

    context 'player inputs zero' do
      subject(:game_zero_input) { described_class.new }
      it 'returns false' do
        invalid_input= 0
        expect(game_zero_input.valid_input?(invalid_input)).to be false
      end
    end
  end

  describe '#switch_active_players' do
    player1 = Player.new(Board::PIECE1, 1, 'Normi')
    player2 = Player.new(Board::PIECE2, 2, 'Sandy')
    subject(:game_new) { described_class.new(player1, player2) }
    it 'changes the active player from one to two' do
      expect { game_new.switch_active_players }.to change(game_new, :active_player).from(player1).to(player2)
    end
  end
end
