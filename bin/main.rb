#!/usr/bin/env ruby

# frozen_string_literal: true

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
  attr_accessor :pos, :turn

  def initialize
    @pos = Array.new(9, ' ')
    @counter = 0
    @turn = 1
  end

  def welcome
    puts 'Welcome to the Tic-Tac-Toe game'
    puts 'TODO: Explain rules'
    puts 'Press ENTER key to continue'
    gets.chomp
  end

  def clear_screen
    Gem.win_platform? ? (system 'cls') : (system 'clear')
  end

  def add(symbol, position)
    @pos[position] = symbol
    @turn += 1
  end

  def show_board
    puts 'this is the board you are playing on'
    puts "TURN: #{@turn}"
    puts 'Player 1: Collins (X)           Player 2: Jair (O)'
    puts
    puts "1 | 2 | 3                      #{@pos[0]} | #{@pos[1]} | #{@pos[2]}"
    puts '-------                        ---------'
    puts "4 | 5 | 6                      #{@pos[3]} | #{@pos[4]} | #{@pos[5]}"
    puts '-------                        ---------'
    puts "7 | 8 | 9                      #{@pos[6]} | #{@pos[7]} | #{@pos[8]}"
    puts
  end

  def play_turn(symbol, player)
    # check player
    puts "#{player}: select position of the symbol on the board"
    position = gets.chomp
    add(symbol, position.to_i - 1)
    # save the value in a position variable
    # check if it is a valid move
    # display the symbol on the position choosen
    # save the move
    # check if there is a winner or if a draw else repeat the process with the next play
  end

  def error
    puts 'invalid move, please pick another position'
  end

  def display_winner
    show_board
    puts 'Checking if there is a winner, or there is a draw...'
    # Calling the logic method to check winner
    puts 'Player 1 is the winner'
    # Display the winner of the game
  end

  def winner
    @counter += 1
    return true if @counter == 9

    false
  end
end

interface = Interface.new

interface.clear_screen

puts 'Creating Board' # board = Board.new
puts 'Creating player 1 with "X" mark' # player1 = Player.new('X')
puts 'Creating player 2 with "O" mark' # player2 = Player.new('O')
puts

interface.welcome

interface.clear_screen

game_on = true

while game_on # while !board.empty?
  interface.show_board
  if interface.turn.odd?
    interface.play_turn('X', 'player1') # board.add(interface.play_turn('player1'))
    interface.clear_screen
    puts 'checking if the move is valid'
    puts 'adding the mark from the player 1 to the board'
  else
    interface.play_turn('O', 'player2') # board.add(interface.play_turn('player1'))
    interface.clear_screen
    puts 'checking if the move is valid'
    puts 'adding the mark from the player 2 to the board'
  end
  puts

  game_on = false if interface.winner
end

puts

interface.display_winner
