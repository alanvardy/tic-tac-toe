class Board
  def initialize
    @board = [0,1,2,3,4,5,6,7,8]
    @players = {}
    @player_turn = 1
    puts "WELCOME TO TIC-TAC-TOE"
    create_players
    play_round
  end

  private
  def create_players
    print_divider
    counter = 1
    2.times do
      print "Enter player #{counter} name: "
      name = gets.chomp
      print "Enter player #{counter} symbol: "
      symbol = gets.chomp
      @players[counter] = Player.new(name, symbol)
      counter += 1
    end
  end

  def display
    print_margin
    print_row(@board[0..2])
    print_row(@board[3..5])
    print_row(@board[6..8])
    print_margin
    puts "\n"
  end

  def play_round
    player = @players[@player_turn].name
    print_divider
    display
    puts "Player #{player}'s turn."
    @board[select_square] = @players[@player_turn].symbol
    if game_won
      puts "\n\n!!#{player} wins!!"
    else
      @player_turn == 1 ? @player_turn = 2 : @player_turn = 1
      play_round
    end
  end

  def select_square
    good_input = false
    until good_input == true do
      print "Enter the number for the square desired: "
      answer = gets.chomp.to_i
      if ((0..8).include?(answer) && @board.include?(answer))
        good_input = true
      else
        print "Bad input. "
      end
    end
    answer
  end

  def game_won
    win_combos = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[2,4,6],[0,4,8]]
    win_combos.each do |combo|
      return true if (@board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]])
    end
    false
  end

  def print_row(squares)
    print "\n|" + squares.join("|") + "|"
  end

  def print_margin
    puts ""
    7.times {print "-"}
  end

  def print_divider
    20.times {print "-"}
    puts " "
  end
end

class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end

board = Board.new