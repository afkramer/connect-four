# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  purp = "\u2652"
  yell = "\u264c"

  describe '#drop_possible?' do
    context 'when space is available in the column' do
      board_setup = [['  ', '  ', '  ', '  ', '  ', '  ', '  '],
                     ['  ', '  ', '  ', '  ', '  ', '  ', '  '],
                     ['  ', '  ', '  ', '  ', '  ', '  ', '  '],
                     ['  ', '  ', '  ', '  ', '  ', yell, '  '],
                     ['  ', '  ', '  ', yell, '  ', purp, '  '],
                     ['  ', yell, '  ', purp, purp, yell, '  ']]
      subject(:board_space_available) { described_class.new(board_setup) }

      it 'returns true' do
        expect(board_space_available.drop_possible?(6)).to be true
      end
    end

    context 'when no space is available in the column' do
      board_setup = [['  ', '  ', '  ', '  ', '  ', purp, '  '],
                     ['  ', '  ', '  ', '  ', '  ', yell, '  '],
                     ['  ', '  ', '  ', '  ', '  ', purp, '  '],
                     ['  ', '  ', '  ', '  ', '  ', yell, '  '],
                     ['  ', '  ', '  ', yell, '  ', purp, '  '],
                     ['  ', yell, '  ', purp, purp, yell, '  ']]
      subject(:board_no_space_available) { described_class.new(board_setup) }

      it 'returns false' do
        expect(board_no_space_available.drop_possible?(6)).to be false
      end
    end
  end
  
  describe '#drop_token' do
    context 'when the board is empty' do
      board_setup = [['  ', '  ', '  ', '  ', '  ', '  ', '  '],
                     ['  ', '  ', '  ', '  ', '  ', '  ', '  '],
                     ['  ', '  ', '  ', '  ', '  ', '  ', '  '],
                     ['  ', '  ', '  ', '  ', '  ', '  ', '  '],
                     ['  ', '  ', '  ', '  ', '  ', '  ', '  '],
                     ['  ', '  ', '  ', '  ', '  ', '  ', '  ']]
      subject(:blank_board) { described_class.new(board_setup) }

      it 'matches expected board state after drop' do
        expected_board_state = [['  ', '  ', '  ', '  ', '  ', '  ', '  '],
                                ['  ', '  ', '  ', '  ', '  ', '  ', '  '],
                                ['  ', '  ', '  ', '  ', '  ', '  ', '  '],
                                ['  ', '  ', '  ', '  ', '  ', '  ', '  '],
                                ['  ', '  ', '  ', '  ', '  ', '  ', '  '],
                                ['  ', purp, '  ', '  ', '  ', '  ', '  ']]
        blank_board.drop_token(2, purp)
        expect(blank_board.board).to eq(expected_board_state)
      end
    end

    context 'when the column has tokens in it' do
      board_setup = [['  ', '  ', '  ', '  ', '  ', '  ', '  '],
                     ['  ', '  ', '  ', '  ', '  ', '  ', '  '],
                     ['  ', '  ', '  ', '  ', '  ', '  ', '  '],
                     ['  ', '  ', '  ', '  ', '  ', yell, '  '],
                     ['  ', '  ', '  ', yell, '  ', purp, '  '],
                     ['  ', yell, '  ', purp, purp, yell, '  ']]
      subject(:board_with_tokens) { described_class.new(board_setup) }

      it 'matches expected board state after drop' do
        expected_board =  [['  ', '  ', '  ', '  ', '  ', '  ', '  '],
                           ['  ', '  ', '  ', '  ', '  ', '  ', '  '],
                           ['  ', '  ', '  ', '  ', '  ', purp, '  '],
                           ['  ', '  ', '  ', '  ', '  ', yell, '  '],
                           ['  ', '  ', '  ', yell, '  ', purp, '  '],
                           ['  ', yell, '  ', purp, purp, yell, '  ']]
        board_with_tokens.drop_token(6, purp)
        expect(board_with_tokens.board).to eq(expected_board)
      end
    end

    context 'when the column is full' do
      board_setup = [['  ', '  ', purp, '  ', '  ', '  ', '  '],
                     ['  ', '  ', purp, '  ', '  ', '  ', '  '],
                     ['  ', '  ', purp, '  ', '  ', '  ', '  '],
                     ['  ', '  ', purp, '  ', '  ', '  ', '  '],
                     ['  ', '  ', purp, '  ', '  ', '  ', '  '],
                     ['  ', '  ', purp, '  ', '  ', '  ', '  ']]
      subject(:full_column_board) { described_class.new(board_setup) }

      it 'no change has taken place to the board' do
        expect { full_column_board.drop_token(3, yell) }.not_to change(full_column_board, :board)
      end
    end
  end

  describe '#winner?' do
    context 'when there is no winner' do
      board_setup = [['  ', '  ', '  ', '  ', '  ', '  ', '  '],
                     ['  ', purp, purp, '  ', '  ', '  ', '  '],
                     ['  ', purp, yell, purp, '  ', '  ', '  '],
                     ['  ', yell, yell, purp, '  ', '  ', purp],
                     [yell, purp, yell, yell, yell, '  ', yell],
                     [yell, purp, purp, purp, yell, purp, purp]]
      subject(:board_in_progress) { described_class.new(board_setup) }

      it 'returns false' do
        expect(board_in_progress.winner?).to be false
      end
    end

    context 'when there is a horizontal win with all purple tokens' do
      board_setup = [['  ', '  ', '  ', '  ', '  ', '  ', '  '],
                     ['  ', '  ', '  ', '  ', '  ', '  ', '  '],
                     ['  ', '  ', '  ', '  ', '  ', '  ', '  '],
                     ['  ', purp, purp, purp, purp, '  ', '  '],
                     ['  ', yell, yell, purp, yell, '  ', '  '],
                     ['  ', yell, yell, yell, purp, '  ', '  ']]
      subject(:purple_win) { described_class.new(board_setup) }

      it 'returns true' do
        expect(purple_win.winner?).to be true
      end
    end

    context 'when there is a horizontal win with all yellow tokens' do
      board_setup = [['  ', '  ', '  ', '  ', '  ', '  ', '  '],
                     ['  ', '  ', '  ', '  ', '  ', '  ', '  '],
                     ['  ', '  ', '  ', '  ', '  ', '  ', '  '],
                     [purp, yell, yell, yell, yell, purp, purp],
                     [yell, purp, purp, yell, purp, purp, yell],
                     [yell, yell, purp, purp, yell, yell, purp]]
      subject(:yellow_win) { described_class.new(board_setup) }

      it 'returns true' do
        expect(yellow_win.winner?).to be true
      end
    end

    context 'when there is a vertical win with all purple tokens' do
      board_setup = [['  ', '  ', '  ', '  ', '  ', '  ', '  '],
                     ['  ', '  ', '  ', '  ', purp, '  ', '  '],
                     ['  ', '  ', '  ', '  ', purp, '  ', '  '],
                     ['  ', '  ', '  ', '  ', purp, '  ', '  '],
                     ['  ', '  ', '  ', '  ', purp, '  ', '  '],
                     ['  ', '  ', '  ', '  ', yell, '  ', '  ']]
      subject(:purple_vert_win) { described_class.new(board_setup) }

      it 'returns true' do
        expect(purple_vert_win.winner?).to be true
      end
    end

    context 'when there is a vertical win with all yellow tokens' do
      board_setup = [['  ', yell, '  ', '  ', '  ', '  ', '  '],
                     ['  ', yell, '  ', '  ', '  ', '  ', '  '],
                     ['  ', yell, '  ', '  ', '  ', '  ', '  '],
                     ['  ', yell, '  ', '  ', '  ', '  ', '  '],
                     ['  ', purp, '  ', '  ', '  ', '  ', '  '],
                     ['  ', purp, '  ', '  ', '  ', '  ', '  ']]
      subject(:yellow_vert_win) { described_class.new(board_setup) }

      it 'returns true' do
        expect(yellow_vert_win.winner?).to be true
      end
    end

    context 'when there is a purple downward diagonal win' do
      board_setup = [['  ', '  ', '  ', '  ', '  ', '  ', '  '],
                     ['  ', '  ', '  ', '  ', '  ', '  ', '  '],
                     ['  ', purp, '  ', '  ', '  ', '  ', '  '],
                     ['  ', yell, purp, '  ', '  ', '  ', '  '],
                     ['  ', purp, yell, purp, '  ', '  ', '  '],
                     ['  ', purp, yell, yell, purp, '  ', '  ']]
      subject(:purple_down_diag_win) { described_class.new(board_setup) }

      it 'returns true' do
        expect(purple_down_diag_win.winner?).to be true
      end
    end

    context 'when there is a yellow upward diagonal win' do
      board_setup = [['  ', '  ', '  ', '  ', '  ', '  ', '  '],
                     ['  ', '  ', '  ', '  ', '  ', '  ', yell],
                     ['  ', '  ', '  ', '  ', '  ', yell, purp],
                     ['  ', '  ', '  ', '  ', yell, purp, purp],
                     ['  ', '  ', purp, yell, yell, yell, purp],
                     [purp, yell, purp, purp, purp, yell, yell]]
      subject(:yellow_up_diag_win) { described_class.new(board_setup) }

      it 'returns true' do
        expect(yellow_up_diag_win.winner?).to be true
      end
    end
  end

  describe '#stalemate?' do
    context 'when there are still free spots left on the board and no winner' do
      board_setup = [['  ', '  ', '  ', '  ', '  ', '  ', '  '],
                     ['  ', purp, purp, '  ', '  ', purp, '  '],
                     ['  ', purp, yell, purp, '  ', yell, '  '],
                     [purp, yell, yell, purp, '  ', yell, purp],
                     [yell, purp, yell, yell, yell, purp, yell],
                     [yell, purp, purp, purp, yell, purp, purp]]
      subject(:board_with_free_spots) { described_class.new(board_setup) }

      it 'returns false' do
        expect(board_with_free_spots.stalemate?).to be false
      end
    end

    context 'when there are no free spots left and no winner' do
      board_setup = [[yell, yell, purp, purp, yell, yell, purp],
                     [purp, purp, purp, yell, purp, yell, yell],
                     [yell, yell, yell, purp, yell, purp, purp],
                     [yell, purp, yell, purp, yell, purp, yell],
                     [purp, purp, purp, yell, purp, yell, yell],
                     [yell, yell, purp, yell, purp, yell, purp]]
      subject(:full_board_no_winner) { described_class.new(board_setup) }

      it 'returns true' do
        expect(full_board_no_winner.stalemate?).to be true
      end
    end
  end
end
