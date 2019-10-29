#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative '../lib/board.rb'

class Interface
  def initialize
    @board = Board.new
  end

  def welcome
    clear_screen
    puts 'Welcome to the Tic-Tac-Toe game'
    rules
    puts
    puts 'Press ENTER key to continue'
    gets.chomp
  end

  def clear_screen
    Gem.win_platform? ? (system 'cls') : (system 'clear')
  end

  def display_board
    puts 'this is the board you are playing on'
    puts "=========== TURN #{@board.turn} ==========="
    puts 'Player 1: [ X ]           Player 2: [ O ]'
    puts
    puts "1 | 2 | 3                      #{@board.position[0]} | #{@board.position[1]} | #{@board.position[2]}"
    puts '-------                        ---------'
    puts "4 | 5 | 6                      #{@board.position[3]} | #{@board.position[4]} | #{@board.position[5]}"
    puts '-------                        ---------'
    puts "7 | 8 | 9                      #{@board.position[6]} | #{@board.position[7]} | #{@board.position[8]}"
    puts
  end

  def play_turn
    player = @board.check_turn
    puts "#{player}: select position of the symbol on the board"
    position = gets.chomp

    result = @board.validate_position?(position)
    if result.zero?
      @board.position = position
    else
      display_error(result)
      play_turn
    end
  end

  def display_winner
    clear_screen
    display_board
    if @board.winner == 1
      puts 'Player1 Wins'
    elsif @board.winner == 2
      puts 'Player2 wins'
    else
      puts 'its a draw'
    end
  end

  def play
    until @board.winner.positive?
      clear_screen
      display_board
      play_turn
    end
  end

  private

  def rules
    puts 'Obey these  rules and have a wonderfull experience'
    puts 'The first person to play become player1 with a symbol of X'
    puts 'The Second person to play become player2 with a symbol of O'
    puts 'Each player takes a turn to select a position for the symbol'
  end

  def display_error(result)
    if result == 1
      puts 'Please insert a number'
    elsif result == 2
      puts 'Number must be between 1 and 9'
    else
      puts 'Position taken, choose another position'
    end
  end
end

interface = Interface.new
interface.welcome
interface.play
interface.display_winner
