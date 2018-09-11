require 'tictactoe'

describe 'Board' do
  describe '.initialize' do
    context 'when initialized' do
      it 'creates the board' do
        board = Board.new
        expect(board.layout).to eql([0,1,2,3,4,5,6,7,8])
      end
    end
  end

  describe '.create_players' do
    context 'description' do

    end
  end
end