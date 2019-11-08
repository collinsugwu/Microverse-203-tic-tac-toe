# frozen_string_literal: true

require_relative '../lib/board.rb'

RSpec.describe Board do
  let(:board) { Board.new }

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

  it 'should add an "O" symbol to the third position of the board' do
    board.position = 1
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

  it 'should return "False" as the board is not empty, has some elements' do
    board.position = 1
    expect(board.empty?).to eq false
  end

  it 'should return "True" as the board is full' do
    board.position.size.times do |i|
      board.position = i + 1
    end
    expect(board.full?).to eq true
  end

  it 'should return 1 as the winner is the player 1' do
    board.position = 1
    board.position = 5
    board.position = 2
    board.position = 6
    board.position = 3

    expect(board.winner).to be 1
  end

  it 'should return 2 as the winner is the player 2' do
    board.position = 1
    board.position = 5
    board.position = 2
    board.position = 6
    board.position = 9
    board.position = 4

    expect(board.winner).to be 2
  end

  it 'should return 3 as there is a draw' do
    board.position = 1
    board.position = 2
    board.position = 3
    board.position = 6
    board.position = 4
    board.position = 7
    board.position = 5
    board.position = 9
    board.position = 8

    expect(board.winner).to be 3
  end

  it 'should return 1 as the added position is not an integer' do
    expect(board.validate_position?('stuff')).to be 1
    expect(board.validate_position?('2.3')).to be 1
  end

  it 'should return 2 as the added position is not in the range between 1 and 9' do
    expect(board.validate_position?('23')).to be 2
    expect(board.validate_position?('400')).to be 2
  end
end
