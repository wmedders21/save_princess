def nextMove(n, r, c, grid)
  game = Game.new(n, r, c, grid)
  game.find_princess
  if game.bot_index[0] < game.princess_index[0]
    puts "DOWN"
    return
  elsif game.bot_index[0] > game.princess_index[0]
    puts "UP"
    return
  end
  if game.bot_index[1] < game.princess_index[1]
    puts "RIGHT"
    return
  elsif game.bot_index[1] > game.princess_index[1]
    puts "LEFT"
  end
end

class Game
  attr_reader :bot_index, :princess_index
  def initialize(n, r, c, grid)
    @grid = grid
    @bot_index = [r, c]
    @princess_index = []
  end

  def find_princess
    row = @grid.index(@grid.find { |row| row.include?("p") })
    column = @grid[row].index("p")
    @princess_index = [row, column]
  end
end

