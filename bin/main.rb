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

  def select_symbol
    puts 'Player 1, what symbol do you want to use?'
    print 'Please type \"X\" or \"O\":'
    gets.chomp
    # Check if the symbol is correct
    puts 'Player 2, what symbol do you want to use?'
    print 'Please type \"X\" or \"O\":'
    gets.chomp
    # Check if the symbol is correct
  end


end
