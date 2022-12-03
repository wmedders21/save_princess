require 'rspec'
require_relative '../lib/save_princess.rb'
require 'pry'

RSpec.describe '.displayPathtoPrincess' do
  context 'grid is 3x3, bot is located in center, princess is located in corner' do
    before :each do
      @m = 3
    end

    it 'prints each direction on a new line. Case: princess in TOP LEFT' do
      grid = ["p--", "-m-", "---"]
      expect do
        displayPathtoPrincess(@m, grid)
      end.to output("UP\nLEFT\n").to_stdout
    end

    it 'prints each direction on a new line. Case: princess in TOP RIGHT' do
      grid = ["--p", "-m-", "---"]
      expect do
        displayPathtoPrincess(@m, grid)
      end.to output("UP\nRIGHT\n").to_stdout
    end

    it 'prints each direction on a new line. Case: princess in BOTTOM LEFT' do
      grid = ["---", "-m-", "p--"]
      expect do
        displayPathtoPrincess(@m, grid)
      end.to output("DOWN\nLEFT\n").to_stdout
    end

    it 'prints each direction on a new line. Case: princess in BOTTOM RIGHT' do
      grid = ["---", "-m-", "--p"]
      expect do
        displayPathtoPrincess(@m, grid)
      end.to output("DOWN\nRIGHT\n").to_stdout
    end
  end
end

