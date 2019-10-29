# frozen_string_literal: true

require_relative 'player.rb'

class Board
  # get_board
  attr_accessor :position, :turn

  def initialize
    @position = Array.new(9, ' ')
  end

  # empty?
  def empty?
    @position.size.times do |x|
      return false unless @position[x] != ' '
    end
    true
  end

  def full?
    @position.size.times do |x|
      return false if @position == ' '
    end
    true
  end

  # winning combinations:
  # 0,1,2
  # 3,4,5
  # 6,7,8
  # 0,3,6
  # 1,4,7
  # 2,5,8
  # 0,4,8
  # 2,4,6
  def winner
    winner = false

    3.times do |x|
      if @position[x] == 'X'
        winner = true
      else
        winner = false
      end
    end

    3.times do |x|
      if @position[x + 3] == 'X'
        winner = true
      else
        winner = false
      end
    end

    3.times do |x|
      if @position[x + 6] == 'X'
        winner = true
      else
        winner = false
      end
    end

    if winner == true
      return 'X'
    end

    return 'none'
  end

  # add_symbol
  # full?
  # check_winner

  # def empty?
  #   @board.size.times do |i|
  #     return false unless @board[i].zero?
  #   end
  #   true
  # end

  # # Board.add("X", 5)
  # def add(position)
  #   @turn += 1
  #   if @turn.even?
  #     @board[position] = 1
  #   else
  #     @board[position] = -1
  #   end
  # end

end
