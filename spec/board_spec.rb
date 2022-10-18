# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  pu = "\u2652"
  ye = "\u264c"

  describe '#winner?' do
    context 'when there is a horizontal win with all purple tokens' do
      board_setup = [[' ', ' ', ' ', ' ', ' ', ' ', ' '],
                     [' ', ' ', ' ', ' ', ' ', ' ', ' '],
                     [' ', ' ', ' ', ' ', ' ', ' ', ' '],
                     [' ', pu, pu, pu, pu, ' ', ' '],
                     [' ', ' ', ' ', ' ', ' ', ' ', ' '],
                     [' ', ' ', ' ', ' ', ' ', ' ', ' ']]
      subject(:purple_win) { described_class.new(board_setup) }

      it 'returns true' do
        expect(purple_win.winner?).to be true
      end
    end

    context 'when there is a horizontal win with all yellow tokens' do
      board_setup = [[' ', ' ', ' ', ' ', ' ', ' ', ' '],
                     [' ', ' ', ' ', ' ', ' ', ' ', ' '],
                     [' ', ' ', ' ', ' ', ' ', ' ', ' '],
                     [pu, ye, ye, ye, ye, pu, pu],
                     [' ', ' ', ' ', ' ', ' ', ' ', ' '],
                     [' ', ' ', ' ', ' ', ' ', ' ', ' ']]
      subject(:yellow_win) { described_class.new(board_setup) }

      it 'returns true' do
        expect(yellow_win.winner?).to be true
      end
    end

    context 'when there is no winner' do
      board_setup = [[' ', ' ', ' ', ' ', ye, ' ', ' '],
                     [' ', pu, pu, ' ', ' ', ' ', ' '],
                     [' ', ' ', ' ', pu, ' ', ' ', ' '],
                     [' ', ' ', ' ', pu, ' ', ' '],
                     [ye, ' ', ye, ' ', ye, ' ', ye],
                     [' ', ' ', ' ', ' ', ' ', ' ', ' ']]
      subject(:board_in_progress) { described_class.new(board_setup) }

      it 'returns false' do
        expect(board_in_progress.winner?).to be false
      end
    end

    context 'when there is a vertical win with all purple tokens' do
      board_setup = [[' ', ' ', ' ', ' ', ' ', ' ', ' '],
                     [' ', ' ', ' ', ' ', pu, ' ', ' '],
                     [' ', ' ', ' ', ' ', pu, ' ', ' '],
                     [' ', ' ', ' ', ' ', pu, ' ', ' '],
                     [' ', ' ', ' ', ' ', pu, ' ', ' '],
                     [' ', ' ', ' ', ' ', ' ', ' ', ' ']]
      subject(:purple_vert_win) { described_class.new(board_setup) }

      it 'returns true' do
        expect(purple_vert_win.winner?).to be true
      end
    end
  end
end
