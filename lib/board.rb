# frozen_string_literal: true

require_relative 'player.rb'

class Board
  attr_reader :position, :turn

  # @turn = 0
  def initialize
    @position = Array.new(9, ' ')
    @turn = 1
  end

  def position=(position)
    @position[(position.to_i - 1)] = @turn.odd? ? 'X' : 'O'
    @turn += 1
  end

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

  def check_turn
    if @turn.odd?
      'player 1'
    else
      'player 2'
    end
  end

  # returns 1 if player 1 wins, returns 2 if player 2 wins, returns 0 if there is no winner, and returns 3 if there is a draw
  def winner
    3.times { |i| return 1 if @position[0 + (i * 3)] == 'X' && @position[1 + (i * 3)] == 'X' && @position[2 + (i * 3)] == 'X' }
    3.times { |i| return 1 if @position[0 + i] == 'X' && @position[3 + i] == 'X' && @position[6 + i] == 'X' }
    2.times { |i| return 1 if @position[0 + (i * 2)] == 'X' && @position[4] == 'X' && @position[8 - (i * 2)] == 'X' }
    3.times { |i| return 2 if @position[0 + (i * 3)] == 'O' && @position[1 + (i * 3)] == 'O' && @position[2 + (i * 3)] == 'O' }
    3.times { |i| return 2 if @position[0 + i] == 'O' && @position[3 + i] == 'O' && @position[6 + i] == 'O' }
    2.times { |i| return 2 if @position[0 + (i * 2)] == 'O' && @position[4] == 'O' && @position[8 - (i * 2)] == 'O' }
    return 3 if full?

    0
  end

  def validate_position?(position)
    # position = position.to_i
    # return false unless position.between?(1, 9)
    return false unless position.to_i.is_a? Integer
    return false unless position.to_i.between?(1, 9)
    return false unless @position[position.to_i - 1] == ' '

    true
  end

  # private

  # def board_position(position)
  #   position -= 1
  #   @position[position]
  # end
end
