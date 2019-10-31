# frozen_string_literal: true

class Board
  attr_reader :position, :turn

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
    3.times do |i|
      return 1 if all_equal(i, 'X')
      return 2 if all_equal(i, 'O')
    end

    return 3 if full?

    0
  end

  def all_equal(index, player_symbol)
    return true if (@position[0 + (index * 3)] + @position[1 + (index * 3)] + @position[2 + (index * 3)] == player_symbol * 3) ||
                   (@position[0 + index] + @position[3 + index] + @position[6 + index] == player_symbol * 3) ||
                   (@position[0 + (index * 2)] + @position[4] + @position[8 - (index * 2)] == player_symbol * 3 && index < 2)

    false
  end

  def validate_position?(position)
    return 1 unless position.to_i.is_a? Integer
    return 2 unless position.to_i.between?(1, 9)
    return 3 unless @position[position.to_i - 1] == ' '

    0
  end
end
