# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  pu = "\u2652"
  ye = "\u264c"

  describe '#winner?' do
    context 'when there is a horizontal win with all purple tokens' do
      board_setup = [[' ', ' ', ' ', ' ', ' ', ' ', ' '],
                     [' ', ' ', ' ', ' ', ' ', ' ', ' '],
                     [' ', ' ', ' ', ' ',' ', ' ', ' '],
                     [' ', pu, pu, pu, pu, ' ', ' '],
                     [' ', ' ', ' ', ' ', ' ', ' ', ' '],
                     [' ', ' ', ' ', ' ', ' ', ' ', ' ']]
      subject(:winning_board) { described_class.new(board_setup) }

      it 'returns true' do
        expect(winning_board.winner?).to be true
      end
    end

    context 'when'
  end
end
