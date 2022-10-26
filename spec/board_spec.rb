# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  pur = "\u2652"
  yel = "\u264c"

  describe '#drop_token' do
    context 'when the board is empty' do
      board_setup = [[' ', ' ', ' ', ' ', ' ', ' ', ' '],
                     [' ', ' ', ' ', ' ', ' ', ' ', ' '],
                     [' ', ' ', ' ', ' ', ' ', ' ', ' '],
                     [' ', ' ', ' ', ' ', ' ', ' ', ' '],
                     [' ', ' ', ' ', ' ', ' ', ' ', ' '],
                     [' ', ' ', ' ', ' ', ' ', ' ', ' ']]
      subject(:blank_board) { described_class.new(board_setup) }

      it 'matches expected board state after drop' do
        expected_board_state = [[' ', ' ', ' ', ' ', ' ', ' ', ' '],
                                [' ', ' ', ' ', ' ', ' ', ' ', ' '],
                                [' ', ' ', ' ', ' ', ' ', ' ', ' '],
                                [' ', ' ', ' ', ' ', ' ', ' ', ' '],
                                [' ', ' ', ' ', ' ', ' ', ' ', ' '],
                                [' ', pur, ' ', ' ', ' ', ' ', ' ']]
        expect(blank_board.drop_token(2, pur).get_board).to eq(expected_board_state)
      end
    end
  end

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

    context 'when there is a purple downward diagonal win' do
      board_setup = [[' ', ' ', ' ', ' ', ' ', ' ', ' '],
                     [' ', ' ', ' ', ' ', ' ', ' ', ' '],
                     [' ', pur, ' ', ' ', ' ', ' ', ' '],
                     [' ', yel, pur, ' ', ' ', ' ', ' '],
                     [' ', pur, yel, pur, ' ', ' ', ' '],
                     [' ', pur, yel, yel, pur, ' ', ' ']]
      subject(:purple_down_diag_win) { described_class.new(board_setup) }

      it 'returns true' do
        expect(purple_down_diag_win.winner?).to be true
      end
    end

    context 'when there is a yellow upward diagonal win' do
      board_setup = [[' ', ' ', ' ', ' ', ' ', ' ', ' '],
                     [' ', ' ', ' ', ' ', ' ', ' ', yel],
                     [' ', ' ', ' ', ' ', ' ', yel, pur],
                     [' ', ' ', ' ', ' ', yel, pur, pur],
                     [' ', ' ', pur, yel, yel, yel, pur],
                     [pur, yel, pur, pur, pur, yel, yel]]
      subject(:yellow_up_diag_win) { described_class.new(board_setup) }

      it 'returns true' do
        expect(yellow_up_diag_win.winner?).to be true
      end
    end
  end
end
