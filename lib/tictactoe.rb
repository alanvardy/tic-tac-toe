class Board
  attr_reader :layout
  attr_accessor :players, :player_turn
  def initialize
    @layout = [0,1,2,3,4,5,6,7,8]
    @players = []
    @player_turn = 1
  end

  def start
    create_players
    play_round
  end

  def create_players
    puts "WELCOME TO TIC-TAC-TOE"
    print_divider
    [1,2].each do |num|
      add_player(num)
    end
  end

  def add_player(num)
      print "Enter player #{num} name: "
      name = gets.chomp
      print "Enter #{name}'s symbol: "
      symbol = gets.chomp
      @players << Player.new(name, symbol)
  end

  def display_board
    print_margin
    rows = [0..2, 3..5, 6..8]
    rows.each {|squares| print_row(@layout[squares])}
    print_margin
    puts "\n"
  end

  def play_round
    player = @players[@player_turn]
    print_divider
    display_board
    puts "Player #{player.name}'s turn."
    @layout[select_square] = player.symbol
    unless game_won?(player.name)
      @player_turn == 1 ? @player_turn = 0 : @player_turn = 1
      play_round
    end
  end

  def select_square
    loop do
      print "Enter the number for the square desired: "
      answer = gets.chomp.to_i
      return answer if valid_selection?(answer)
      print "Bad input. "
    end
  end

  def valid_selection?(answer)
    ((0..8).include?(answer) && @layout.include?(answer))
  end

  def game_won?(player)
    if three_in_a_line?
      display_board
      puts "\n\n!!#{player} wins!!"
      return true
    end
    return false
  end

  def three_in_a_line?(num = 0)
    return false if num == 8
    combinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],
                    [1,4,7],[2,5,8],[2,4,6],[0,4,8]]
    combo = combinations[num]
    if @layout[combo[0]] == @layout[combo[1]] && @layout[combo[1]] == @layout[combo[2]]
      return true
    else
      three_in_a_line?(num + 1)
    end
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

