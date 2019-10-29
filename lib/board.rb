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
      return false if @position[x] == ' '
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
    3.times { |i| return 'X' if @position[0 + (i * 3)] == 'X' && @position[1 + (i * 3)] == 'X' && @position[2 + (i * 3)] == 'X' }
    3.times { |i| return 'X' if @position[0 + i] == 'X' && @position[3 + i] == 'X' && @position[6 + i] == 'X' }
    2.times { |i| return 'X' if @position[0 + (i * 2)] == 'X' && @position[4] == 'X' && @position[8 - (i * 2)] == 'X' }
    3.times { |i| return 'O' if @position[0 + (i * 3)] == 'O' && @position[1 + (i * 3)] == 'O' && @position[2 + (i * 3)] == 'O' }
    3.times { |i| return 'O' if @position[0 + i] == 'O' && @position[3 + i] == 'O' && @position[6 + i] == 'O' }
    2.times { |i| return 'O' if @position[0 + (i * 2)] == 'O' && @position[4] == 'O' && @position[8 + (i * 2)] == 'O' }

    'no winner'
  end
end
