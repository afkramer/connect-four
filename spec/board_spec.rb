# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  pur = "\u2652"
  yel = "\u264c"

  describe '#winner?' do
    context 'when there is no winner' do
      board_setup = [[' ', ' ', ' ', ' ', ' ', ' ', ' '],
                     [' ', pur, pur, ' ', ' ', ' ', ' '],
                     [' ', pur, yel, pur, ' ', ' ', ' '],
                     [' ', yel, yel, pur, ' ', ' ', pur],
                     [yel, pur, yel, yel, yel, ' ', yel],
                     [yel, pur, pur, pur, yel, pur, pur]]
      subject(:board_in_progress) { described_class.new(board_setup) }

      it 'returns false' do
        expect(board_in_progress.winner?).to be false
      end
    end

    context 'when there is a horizontal win with all purple tokens' do
      board_setup = [[' ', ' ', ' ', ' ', ' ', ' ', ' '],
                     [' ', ' ', ' ', ' ', ' ', ' ', ' '],
                     [' ', ' ', ' ', ' ', ' ', ' ', ' '],
                     [' ', pur, pur, pur, pur, ' ', ' '],
                     [' ', yel, yel, pur, yel, ' ', ' '],
                     [' ', yel, yel, yel, pur, ' ', ' ']]
      subject(:purple_win) { described_class.new(board_setup) }

      it 'returns true' do
        expect(purple_win.winner?).to be true
      end
    end

    context 'when there is a horizontal win with all yellow tokens' do
      board_setup = [[' ', ' ', ' ', ' ', ' ', ' ', ' '],
                     [' ', ' ', ' ', ' ', ' ', ' ', ' '],
                     [' ', ' ', ' ', ' ', ' ', ' ', ' '],
                     [pur, yel, yel, yel, yel, pur, pur],
                     [yel, pur, pur, yel, pur, pur, yel],
                     [yel, yel, pur, pur, yel, yel, pur]]
      subject(:yellow_win) { described_class.new(board_setup) }

      it 'returns true' do
        expect(yellow_win.winner?).to be true
      end
    end

    context 'when there is a vertical win with all purple tokens' do
      board_setup = [[' ', ' ', ' ', ' ', ' ', ' ', ' '],
                     [' ', ' ', ' ', ' ', pur, ' ', ' '],
                     [' ', ' ', ' ', ' ', pur, ' ', ' '],
                     [' ', ' ', ' ', ' ', pur, ' ', ' '],
                     [' ', ' ', ' ', ' ', pur, ' ', ' '],
                     [' ', ' ', ' ', ' ', yel, ' ', ' ']]
      subject(:purple_vert_win) { described_class.new(board_setup) }

      it 'returns true' do
        expect(purple_vert_win.winner?).to be true
      end
    end

    context 'when there is a vertical win with all yellow tokens' do
      board_setup = [[' ', yel, ' ', ' ', ' ', ' ', ' '],
                     [' ', yel, ' ', ' ', ' ', ' ', ' '],
                     [' ', yel, ' ', ' ', ' ', ' ', ' '],
                     [' ', yel, ' ', ' ', ' ', ' ', ' '],
                     [' ', pur, ' ', ' ', ' ', ' ', ' '],
                     [' ', pur, ' ', ' ', ' ', ' ', ' ']]
      subject(:yellow_vert_win) { described_class.new(board_setup) }

      it 'returns true' do
        expect(yellow_vert_win.winner?).to be true
      end
    end

    context 'when there is a purple diagonal win' do
      board_setup = [[' ', ' ', ' ', ' ', ' ', ' ', ' '],
                     [' ', ' ', ' ', ' ', ' ', ' ', ' '],
                     [' ', pur, ' ', ' ', ' ', ' ', ' '],
                     [' ', yel, pur, ' ', ' ', ' ', ' '],
                     [' ', pur, yel, pur, ' ', ' ', ' '],
                     [' ', pur, yel, yel, pur, ' ', ' ']]
      subject(:purple_diag_win) { described_class.new(board_setup) }

      it 'returns true' do
        expect(purple_diag_win.winner?).to be true
      end
    end
  end
end