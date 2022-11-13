# frozen_string_literal: true

require_relative '../lib/player'
require_relative '../lib/board'

describe Player do

  describe '#switch_turn' do
    context 'the player is the active player' do
      subject(:player_has_turn) { described_class.new(Board::PIECE1, 'Martina') }

      it 'changes @has_turn from true to false' do
        expect { player_has_turn.switch_turn }.to change(player_has_turn, :has_turn).from(true).to(false)
      end
    end

    context 'the player is not the active player' do
      subject(:player_does_not_have_turn) { described_class.new(Board::PIECE2, 'Normi') }

      it 'changes @has_turn from false to true' do
        expect { player_does_not_have_turn.switch_turn }.to change(player_does_not_have_turn, :has_turn).from(false).to(true)
      end
    end
  end
end
