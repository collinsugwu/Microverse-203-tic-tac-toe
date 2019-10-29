# frozen_string_literal: true

class Board
  attr_accessor :board, :turn

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
