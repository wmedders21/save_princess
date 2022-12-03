require 'pry'
require 'rspec'
require_relative '../lib/save_princess_2'

RSpec.describe '.nextMove' do
  before :each do
    @n = 5
    @r = 1
    @c = 1
    @grid = ["-----", "-m---", "-----", "---p-", "-----"]
  end
  
  it 'prints out the next move' do
    expect do
      nextMove(@m, @r, @c, @grid)
    end.to output("DOWN\n").to_stdout
  end
end
