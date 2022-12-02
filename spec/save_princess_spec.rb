require 'rspec'
require './lib/save_princess.rb'
require 'pry'
RSpec.describe SavePrincess do
  before :each do
    @game = SavePrincess.new
    @m = 3
    @grid = Array.new(@m)
    @grid[0] = "---"
    @grid[1] = "-m-"
    @grid[2] = "p--"
  end
  it 'exists' do
    expect(@game.bot_index).to eq([])
    expect(@game.princess_index).to eq([])
  end
  describe 'helper methods' do
    it '.find_bot_index returns an array of 2 integers' do
      expect(@game.find_bot_index(m, grid)).to eq([1, 1])
      expect(@game.find_bot_index(m, grid)[0]).to be_a(Integer)
      expect(@game.find_bot_index(m, grid)[1]).to be_a(Integer)
      expect(@game.find_bot_index(m, grid).length).to eq(2)
    end
  describe 'displayPathtoPrincess' do
    it 'returns a string' do
      expect(@game.displayPathtoPrincess(@m, @grid)).to be_a(String)
    end
  end
end

