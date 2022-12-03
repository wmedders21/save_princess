require 'rspec'
require './lib/save_princess.rb'
require 'pry'

RSpec.describe 'save_princess' do
  before :each do
    @m = 3
    @grid = Array.new(@m)
    @grid[0] = "---"
    @grid[1] = "-m-"
    @grid[2] = "p--"
  end
  
  describe 'helper methods' do
    it '.bot_starting_postion sets @bot_index to coordinates' do
      bot_starting_postion(@m, @grid)
      expect(@bot_index[0]).to eq(1)
      expect(@bot_index[1]).to eq(1)
      expect(@bot_index.length).to eq(2)
    end
    it '.princess_location sets @princess_index to coordinates' do
      princess_location(@m, @grid)
      expect(@princess_index[0]).to eq(2)
      expect(@princess_index[1]).to eq(0)
      expect(@princess_index.length).to eq(2)
    end
  end

  describe 'displayPathtoPrincess' do
    it 'returns a string' do
      expect(displayPathtoPrincess(@m, @grid)).to be_a(String)
    end
    it 'prints each move on a new line' do
      expect do
        displayPathtoPrincess(@m, @grid)
      end.to output("DOWN\nLEFT\n").to_stdout
    end
  end
end

