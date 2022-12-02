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
    it '.bot_starting_postion sets @bot_index to coordinates' do
      @game.bot_starting_postion(@m, @grid)
      expect(@game.bot_index[0]).to eq(1)
      expect(@game.bot_index[1]).to eq(1)
    end
  end
  describe 'displayPathtoPrincess' do
    it 'returns a string' do
      expect(@game.displayPathtoPrincess(@m, @grid)).to be_a(String)
    end
  end
end

