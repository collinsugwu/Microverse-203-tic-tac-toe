# frozen_string_literal: true

require_relative '../lib/board.rb'

RSpec.describe Board do
  board = Board.new
  validate = Board.new

  it 'should return "True" as the board is empty, has no elements' do
    expect(board.empty?).to eq true
  end

  it 'should return "False" as the board is not full' do
    expect(board.full?).to eq false
  end

  it 'should create a student class' do
    expect(board).to be_kind_of(Board)
  end

  it 'should show "Player 1" as the first turn is for the player 1' do
    expect(board.check_turn).to be 1
  end

  it 'should add an "X" symbol to the second position of the board' do
    board.position = 2
    expect(board.position[1]).to be 'X'
  end

  it 'should add an "O" symbol to the thrid position of the board' do
    board.position = 3
    expect(board.position[2]).to be 'O'
  end

  it 'should return a integer' do
    expect(board.position = 1).to be_an(Numeric)
  end

  it 'should return a string' do
    board.position = 6
    expect(board.position[5]).to be_an(String)
  end

  it 'should return "False" as the board is empty, has no elements' do
    expect(board.empty?).to eq false
  end

  it 'should return "True" as the board is full' do
    board.position.size.times do |i|
      board.position = i + 1
    end
    expect(board.full?).to eq true
  end

  it 'should return 1 as the winner is the player 1' do
    play1 = Board.new

    play1.position = 1
    play1.position = 5
    play1.position = 2
    play1.position = 6
    play1.position = 3

    expect(play1.winner).to be 1
  end

  it 'should return 2 as the winner is the player 2' do
    play1 = Board.new

    play1.position = 1
    play1.position = 5
    play1.position = 2
    play1.position = 6
    play1.position = 9
    play1.position = 4

    expect(play1.winner).to be 2
  end

  it 'should return 3 as there is a draw' do
    play1 = Board.new

    play1.position = 1
    play1.position = 2
    play1.position = 3
    play1.position = 6
    play1.position = 4
    play1.position = 7
    play1.position = 5
    play1.position = 9
    play1.position = 8

    expect(play1.winner).to be 3
  end

  it 'should return 1 as the added position is not an integer' do
    expect(validate.validate_position?('stuff')).to be 1
    expect(validate.validate_position?('2.3')).to be 1
  end

  it 'should return 2 as the added position is not in the range between 1 and 9' do
    expect(validate.validate_position?('23')).to be 2
    expect(validate.validate_position?('400')).to be 2
  end
end
