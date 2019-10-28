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
  def welcome
    puts 'Welcome to the Tic-Tac-Toe game'
    puts 'TODO: Explain rules'
  end

  def ask_name
    @player = Array.new(2, '')
    puts 'Player 1, what\'s your name?'
    @player[0] = gets.chomp
    puts 'Player 2, what\'s your name?'
    @player[1] = gets.chomp
    @player
  end

  def play_turn
    puts 'Player 1, what symbol do you want to use?'
    print 'Please type \"X\" or \"O\":'
    gets.chomp
    # Check if the symbol is correct
    puts 'Player 2, what symbol do you want to use?'
    print 'Please type "X" or "O":'
    gets.chomp
    # Check if the symbol is correct
  end

  def choose_first_player
    # form the player_symbol array, choose the player with the symbol X
    # to play first
  end

  def clear_screen
    # this method clears the screen
  end

  def show_board
    puts 'this is the board you are playing on'
    puts 'Player 1: Collins (X)           Player 2: Jair (O)'
    puts
    puts '1|2 |3                         X | O | X'
    puts '-------                        ---------'
    puts '4|5 |6                           | X |'
    puts '-------                        ---------'
    puts '7|8 |10                          | O | X'
    puts

    # display the tic tac toe board
  end

  def play_turn
    # check player
    puts 'select position of the symbol on the board'
    gets.chomp
    # save the value in a position variable
    # check if it is a valid move
    # display the symbol on the position choosen
    # save the move
    # check if there is a winner or if a draw else repeat the process with the next play
  end

  def display_winner
    puts 'Player 1 is the winner'
    # display the winner of the game
  end

  def clear_board
    # reset the board for new game
  end
end

interface = Interface.new
puts 'Creating Board' # board = Board.new
puts 'Creating player 1 with "X" mark' # player1 = Player.new('X')
puts 'Creating player 2 with "O" mark' # player2 = Player.new('O')

interface.welcome

turn = 1 # needed for the mockup
while turn < 5 # while !board.empty?
  interface.clear_screen
  interface.show_board
  if turn.odd?
    interface.play_turn('player1') # board.add(interface.play_turn('player1'))
    puts 'checking if the move is valid'
    puts 'adding the mark from the player 1 to the board'
  else
    interface.play_turn('player2') # board.add(interface.play_turn('player1'))
    puts 'checking if the move is valid'
    puts 'adding the mark from the player 2 to the board'
  end
  turn += 1 # simulating the turn order. The while loop should break if the board is full of if there is a winner
end

interface.display_winner
