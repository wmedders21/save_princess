require 'pry'
require 'rspec'
require_relative '../lib/save_princess_2'

RSpec.describe '.nextMove' do
  context 'grid is 5X5' do
    before :each do
      @n = 5
    end

    it 'prints DOWN when the princess is below the bot on the grid' do
      r = 0
      c = 1
      grid = ["-m---", "-----", "-----", "---p-", "-----"]
      expect do
        nextMove(@n, r, c, grid)
      end.to output("DOWN\n").to_stdout
    end

    it 'prints UP when the princess is above the bot on the grid' do
      r = 1
      c = 2
      grid = ["-p---", "--m--", "-----", "-----", "-----"]
      expect do
        nextMove(@n, r, c, grid)
      end.to output("UP\n").to_stdout
    end

    it 'prints RIGHT when the princess is after the bot on the same row' do
      r = 1
      c = 1
      grid = ["-----", "-m--p", "-----", "-----", "-----"]
      expect do
        nextMove(@n, r, c, grid)
      end.to output("RIGHT\n").to_stdout
    end

    it 'prints LEFT when the princess is before the bot on the same row' do
      r = 1
      c = 1
      grid = ["-----", "pm---", "-----", "-----", "-----"]
      expect do
        nextMove(@n, r, c, grid)
      end.to output("LEFT\n").to_stdout
    end
  end

  describe Game do
    it 'has attributes upon initialization' do
      g = Game.new(3, 1, 0, ["---", "m--", "-p-"])
      expect(g.bot_index).to eq([1, 0])
      expect(g.princess_index).to eq([])
    end

    it '.find_princess updates @princess_index attribute' do
      g = Game.new(3, 1, 0, ["---", "m--", "-p-"])
      expect(g.princess_index).to eq([])
      g.find_princess
      expect(g.princess_index).to eq([2, 1])
    end
  end
end
