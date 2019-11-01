require './lib/board.rb'

RSpec.describe Board do
  board = Board.new
  it 'should create a student class' do
    expect(board).to be_kind_of(Board)
  end

  it 'should return a integer' do
    expect(board.position = 1).to be_an(Numeric)
    expect(board.position = 1).to be_an(Numeric)
  end

  it 'should return a boolean' do
    expect(board.empty?).to should be(true)
  end
end
