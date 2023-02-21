WINS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze

class Game
  attr_accessor :players, :board, :current_player_id

  def initialize()
    @players = []
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @current_player_id = 0
  end

  def add_player(player)
    @players << player
  end

  def current_player
    @players[current_player_id]
  end

  def showboard
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '___________'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '___________'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    puts ' '
  end

  def play
    loop do
      update(current_player)
      if winner?(current_player)
        puts "#{current_player.name} wins!"
        showboard
        return
      elsif draw?
        puts "It's a draw!"
        showboard
        return
      end
      switch_players!
    end
  end

  def update(player)
    position = player.select_position!.to_i
    if valid?(position)
      puts "#{player.name} selects #{player.token} position #{position + 1}"
      @board[position] = player.token
    else
      puts 'Invalid! Choose Another Spot!'
      update(player)
    end
  end

  def valid?(choice)
    @board[choice] == ' '
  end

  def winner?(player)
    WINS.any? do |line|
      line.all? { |position| @board[position] == player.token }
    end
  end

  def full?
    @board.all? { |x| %w[X O].include?(x) }
  end

  def other_id
    1 - @current_player_id
  end

  def switch_players!
    @current_player_id = other_id
  end

  def draw?
    if !winner?(current_player) && full?
      true
    elsif !winner?(current_player) && !full?
      false
    elsif winner?(current_player)
      false
    end
  end

  def over?
    false unless draw? || winner?(current_player) || full?
  end
end

class Player
  attr_accessor :name, :token, :game, :id

  def initialize(name, id, game, token)
    @name = name
    @game = game
    @token = token
    @id = id
  end

  def select_position!
    @game.showboard
    puts "Select your #{token} position"
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
end

game1 = Game.new()

usborn = Player.new('Usborn', 0, game1, 'X')
ash = Player.new('Ashley', 1, game1, 'O')

game1.add_player(usborn)
game1.add_player(ash)

game1.play
