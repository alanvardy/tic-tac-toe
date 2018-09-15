require 'tictactoe'

describe 'Board' do
  let(:board) {Board.new}
  describe '.initialize' do
    context 'when initialized' do
      it 'creates the board' do
        expect(board.layout).to eql([0,1,2,3,4,5,6,7,8])
      end
      it 'sets the player turn' do
        expect(board.player_turn).to eq(1)
      end
    end
  end

  describe '.add_player' do
    pending 'Need to figure out inputting'
  end

  describe '.display_board' do
    pending 'how do I do visual output?'
  end

  describe '.play_round' do
    pending 'how do I do this one?'
  end

  describe '.select_square' do
    context 'Good input' do
      described_class.any_instance.stub(gets: '1')
      expect
    end
  end
end