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
    return 'X' if @position[0] == 'X' && @position[1] == 'X' && @position[2] == 'X'
    return 'X' if @position[3] == 'X' && @position[4] == 'X' && @position[5] == 'X'
    return 'X' if @position[6] == 'X' && @position[7] == 'X' && @position[8] == 'X'
    return 'X' if @position[0] == 'X' && @position[3] == 'X' && @position[6] == 'X'
    return 'X' if @position[1] == 'X' && @position[4] == 'X' && @position[7] == 'X'
    return 'X' if @position[2] == 'X' && @position[5] == 'X' && @position[8] == 'X'
    return 'X' if @position[0] == 'X' && @position[4] == 'X' && @position[8] == 'X'
    return 'X' if @position[2] == 'X' && @position[4] == 'X' && @position[6] == 'X'

    return 'O' if @position[0] == 'O' && @position[1] == 'O' && @position[2] == 'O'
    return 'O' if @position[3] == 'O' && @position[4] == 'O' && @position[5] == 'O'
    return 'O' if @position[6] == 'O' && @position[7] == 'O' && @position[8] == 'O'
    return 'O' if @position[0] == 'O' && @position[3] == 'O' && @position[6] == 'O'
    return 'O' if @position[1] == 'O' && @position[4] == 'O' && @position[7] == 'O'
    return 'O' if @position[2] == 'O' && @position[5] == 'O' && @position[8] == 'O'
    return 'O' if @position[0] == 'O' && @position[4] == 'O' && @position[8] == 'O'
    return 'O' if @position[2] == 'O' && @position[4] == 'O' && @position[6] == 'O'

    'no winner'
  end
end
