# frozen_string_literal: true

# Class Player
# Class Symbol
# Class Board
#   arr(9)
#   check_winner

#   board(9)
#   0 1 2
#   3 4 5
#   6 7 8
#   board[1] = 0  <- Empty  zero?
#   board[1] = 1  <- X    positive?
#   board[1] = -1 <- O    negative?
# if variable.positive?
#

class Player
  @player_hash = Hash.new(0)
  def initialize(player_name)
    @player_name = player_name
    if @player_hash.empty?
      @player_hash[:first_player] = @player_name
    else
      @player_hash[:second_player] = @player_name
    end
  end

  def player
    @player_name
  end
end

class Mark < Player
  @player_mark = Hash.new(0)
  def initialize(mark)
    @mark = mark
  end
end

class Board
  def initialize
    @board = Array.new(9, 0)
    @turn = 0
  end

  def empty?
    @board.size.times do |i|
      return false unless @board[i].zero?
    end
    true
  end

  # Board.add("X", 5)
  def add(position)
    @turn += 1
    if @turn.even?
      @board[position] = 1
    else
      @board[position] = -1
    end
  end
end
