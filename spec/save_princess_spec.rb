require 'rspec'
require_relative './spec_helper'
require_relative '../lib/save_princess'

RSpec.describe '.displayPathtoPrincess' do
  context 'grid is 3x3, bot is located in center, princess is located in corner' do
    before :each do
      @m = 3
    end

    it 'prints each direction on a new line. Case: princess in TOP LEFT' do
      grid = ['p--', '-m-', '---']
      expect do
        displayPathtoPrincess(@m, grid)
      end.to output("UP\nLEFT\n").to_stdout
    end

    it 'prints each direction on a new line. Case: princess in TOP RIGHT' do
      grid = ['--p', '-m-', '---']
      expect do
        displayPathtoPrincess(@m, grid)
      end.to output("UP\nRIGHT\n").to_stdout
    end

    it 'prints each direction on a new line. Case: princess in BOTTOM LEFT' do
      grid = ['---', '-m-', 'p--']
      expect do
        displayPathtoPrincess(@m, grid)
      end.to output("DOWN\nLEFT\n").to_stdout
    end

    it 'prints each direction on a new line. Case: princess in BOTTOM RIGHT' do
      grid = ['---', '-m-', '--p']
      expect do
        displayPathtoPrincess(@m, grid)
      end.to output("DOWN\nRIGHT\n").to_stdout
    end
  end

  context 'Testing all remaining allowable grid sizes' do
    (5..100).step(2).to_a.each do |size|
      before :each do
        @m = size
      end

      it 'prints each direction on a new line. Case: princess in TOP LEFT' do
        grid = SpecHelper.make_grids(@m)[0]
        expect do
          displayPathtoPrincess(@m, grid)
        end.to output("UP\nLEFT\n" * (@m / 2)).to_stdout
      end

      it 'prints each direction on a new line. Case: princess in TOP RIGHT' do
        grid = SpecHelper.make_grids(@m)[2]
        expect do
          displayPathtoPrincess(@m, grid)
        end.to output("UP\nRIGHT\n" * (@m / 2)).to_stdout
      end

      it 'prints each direction on a new line. Case: princess in BOTTOM LEFT' do
        grid = SpecHelper.make_grids(@m)[1]
        expect do
          displayPathtoPrincess(@m, grid)
        end.to output("DOWN\nLEFT\n" * (@m / 2)).to_stdout
      end

      it 'prints each direction on a new line. Case: princess in BOTTOM RIGHT' do
        grid = SpecHelper.make_grids(@m)[3]
        expect do
          displayPathtoPrincess(@m, grid)
        end.to output("DOWN\nRIGHT\n" * (@m / 2)).to_stdout
      end
    end
  end

  describe SavePrincess do
    it 'has attributes' do
      game = SavePrincess.new(5, ['p----', '-----', '--m--', '-----', '-----'])
      expect(game.princess_index).to eq([])
      expect(game.bot_index).to eq([2, 2])
    end

    describe 'instance methods' do
      it 'find_princess updates the state of @princess_index' do
        game = SavePrincess.new(5, ['p----', '-----', '--m--', '-----', '-----'])
        expect(game.princess_index).to eq([])

        game.find_princess

        expect(game.princess_index).to eq([0, 0])
      end
    end
  end
end
