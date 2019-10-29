#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative '../lib/board.rb'

# puts 'Hello world!'

# 1.-   Welcome message
# 2.-   Explain rules
# 3.-   Define names of the players
# 4.-   Select symbol ("X" or "O") X simbol is first player
# 5.-   Clear the screen
# 6.-   Show the empty board
# 7.-   Asks for the player in turn to select the position
# 8.-   Clean the screen
# 9.-   Show the updated board
# 10.-  Asks again until the board is filled
# 11.-  Check for the winner
# 12.-  Display the winner
#
# Every time we check for a new position, check if 1) it is a valid move and 2) there is a winner
#
# Each player is an array with two elements: the name and the symbol
#

class Interface
  def initialize
    @board = Board.new
  end

  def welcome
    clear_screen
    puts 'Welcome to the Tic-Tac-Toe game'
    rules
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
    if result == true
      @board.position = position
    else
      puts 'Invalid Position'
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
end

interface = Interface.new

interface.welcome
interface.play
interface.display_winner
