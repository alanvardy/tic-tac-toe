require 'tictactoe'

describe 'Board' do
  let(:board) { board ||= Board.new} #create new board if does not exist
  before do
    allow($stdout).to receive(:write)
  end
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

describe '.create_players' do
  it 'calls print_divider method' do
    allow(board).to receive(:add_player).and_return('passed')
    expect(board).to receive(:print_divider)
    board.create_players
  end

  it 'adds 2 players' do
    expect(board).to receive(:print_divider)
    allow(board).to receive(:add_player).with(1).and_return('passed')
    allow(board).to receive(:add_player).with(2).and_return('passed')
    expect(board.create_players).to eq([1,2])
  end
end

  describe '.add_player' do
      it 'creates a player' do
        allow(board).to receive(:gets).and_return('test\n')
        board.add_player("1")
        expect(board.players.length).to eq(1)
      end
  end

  describe '.display_board' do
    it 'prints margin twice' do
      expect(board).to receive(:print_margin).twice
      allow(board).to receive(:print_row)
      board.display_board
    end

    it 'prints rows 3 times' do
      allow(board).to receive(:print_margin)
      expect(board).to receive(:print_row).exactly(3).times
      board.display_board
    end
  end

  describe '.play_round' do
    context 'when game isn\'t won' do
      pending 'need to fix this'
      it 'changes player' do
        # allow(board).to receive(:print_divider)
        # allow(board).to receive(:display_board)
        # allow(board).to receive(:select_square).and_return(1)
        # expect(board.player_turn).to eq(1)
        # board.players << Player.new("Test", "#")
        # board.player_turn = 0
        # board.play_round
      end
    end
    context 'when game is won' do
      it 'does not play another round' do
        board.players << Player.new("Test", "#")
        board.player_turn = 0
        allow(board).to receive(:print_divider)
        allow(board).to receive(:display_board)
        allow(board).to receive(:select_square).and_return(1)
        expect(board).to_not receive(:play_round)
      end
    end
  end

  describe '.select_square' do
    context 'Good input' do
      it 'does something' do
        allow(board).to receive(:gets).and_return('1/n')
        expect(board.select_square).to eq(1)
      end
    end
  end

  describe '.valid_selection?' do
    context 'When a good option' do
      it 'returns true' do
        expect(board.valid_selection?(1)).to be(true)
      end
    end
    context 'When a bad option' do
      it 'returns false' do
        expect(board.valid_selection?(9)).to be(false)
      end
    end
  end

  describe '.game_won?' do
    context 'when there is three in a line' do
      it 'returns true' do
        allow(board).to receive(:three_in_a_line?).and_return(true)
        expect(board.game_won?('Test')).to be(true)
      end
    end
    context 'when there isn\'t three in a line' do
      it 'returns false' do
        allow(board).to receive(:three_in_a_line?).and_return(false)
        expect(board.game_won?('Test')).to be(false)
      end
    end
  end

  describe '.three_in_a_line' do
    context 'when no match' do
      it 'returns false' do
        expect(board.three_in_a_line?).to be(false)
      end
    end

    context 'when match' do
      pending 'need to fix this'
      it 'returns true' do
        # allow(board).to receive(:layout).and_return(['x', 'x', 'x', 'x', 'x', 'x', 'x', 'x'])
        # expect(board.three_in_a_line?).to be(true)
      end

    end
  end
end

describe 'Player' do
  context 'when initialized' do
    it 'creates a player' do
      player = Player.new('Test', '#')
      expect(player.name).to eq('Test')
      expect(player.symbol).to eq('#')
    end
  end
end