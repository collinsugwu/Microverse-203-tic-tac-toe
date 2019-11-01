# frozen_string_literal: true

class Board
  attr_reader :position, :turn

  def initialize
    @turn = 1
    @symbol_x = 'X'
    @symbol_o = 'O'
    @empty_space = ' '
    @position = Array.new(9, @empty_space)
  end

  def position=(position)
    @position[(position.to_i - 1)] = @turn.odd? ? @symbol_x : @symbol_o
    @turn += 1
  end

  def empty?
    @position.size.times do |x|
      return false unless @position[x] != @empty_space
    end
    true
  end

  def full?
    @position.size.times do |x|
      return false if @position[x] == @empty_space
    end
    true
  end

  def check_turn
    return 1 if @turn.odd?

    2
  end

  # returns 1 if player 1 wins, returns 2 if player 2 wins, returns 0 if there is no winner, and returns 3 if there is a draw
  def winner
    3.times do |i|
      return 1 if all_equal(i, @symbol_x)
      return 2 if all_equal(i, @symbol_o)
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
    return 3 unless @position[position.to_i - 1] == @empty_space

    0
  end
end
