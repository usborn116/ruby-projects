class Board
  attr_accessor :board
  def initialize()
    @board = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
  end

  def showboard
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts '___________'
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts '___________'
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
    puts ' '
  end

  def full?
    board.all? { |x| %w[X O].include?(x) }
  end
end

class Game
  WINS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze

  attr_accessor :players, :board, :current_player_id

  def initialize()
    @players = []
    @board = Board.new
    @current_player_id = 0
  end

  def add_player(player)
    players << player
  end

  def current_player
    players[current_player_id]
  end

  def play
    loop do
      board.showboard
      update(current_player)
      if winner?(current_player)
        puts "#{current_player.name} wins!"
        board.showboard
        return
      elsif draw?
        puts "It's a draw!"
        board.showboard
        return
      end
      switch_players!
    end
  end

  def update(player)
    position = player.select_position!
    if valid?(position)
      puts "#{player.name} puts #{player.token} in position #{position + 1}"
      board.board[position] = player.token
    else
      puts 'Invalid! Choose Another Spot!'
      update(player)
    end
  end

  def valid?(choice)
    %w(X O).each{|token| board.board[choice] != token}
  end

  def winner?(player)
    WINS.any? do |line|
      line.all? { |position| board.board[position] == player.token }
    end
  end

  def other_id
    1 - self.current_player_id
  end

  def switch_players!
    self.current_player_id = other_id
  end

  def draw?
    !winner?(current_player) && board.full?
  end

  def over?
    false unless draw? || winner?(current_player) || board.full?
  end
end

class Player
  attr_accessor :name, :token, :game, :id

  def initialize(game)
    @name = set_name
    @game = game
    @token = set_token
  end

  def select_position!
    puts "#{name}: Choose the position for your #{token}"
    selection = gets.to_i
    if (1..9).include?(selection)
      selection - 1
    else
      puts 'Not a number! Choose a position between 1 and 9'
      select_position!
    end
  end

  def to_s
    Player.name
  end

  private

  def set_name
    puts "What is your name?"
    gets.chomp
  end
  
  def set_token
    puts "X or O?"
    gets.chomp
  end
end

game = Game.new()

puts "Player 1!"
player1 = Player.new(game)
game.add_player(player1)
puts "Player 2!"
player2 = Player.new(game)
game.add_player(player2)

game.play
