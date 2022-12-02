require 'rspec'
require './lib/save_princess.rb'
require 'pry'
RSpec.describe 'instance methods' do
  describe 'displayPathtoPrincess' do
    before :each do
      @game = SavePrincess.new
      @m = 3
      @grid = Array.new(@m)
      @grid[0] = "---"
      @grid[1] = "-m-"
      @grid[2] = "p--"
    end
    it 'returns a string' do
      expect(@game.displayPathtoPrincess(@m, @grid)).to be_a(String)
    end
  end
end

