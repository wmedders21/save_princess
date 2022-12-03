def displayPathtoPrincess(m, grid)
  game = SavePrincess.new(m, grid)
  game.find_princess

  until game.bot_index == game.princess_index
    if game.bot_index[0] < game.princess_index[0]
      game.bot_index[0] += 1
      puts 'DOWN'
    else
      game.bot_index[0] -= 1
      puts 'UP'
    end

    if game.bot_index[1] < game.princess_index[1]
      game.bot_index[1] += 1
      puts 'RIGHT'
    else
      game.bot_index[1] -= 1
      puts 'LEFT'
    end
  end
end

class SavePrincess
  attr_reader :princess_index
  attr_accessor :bot_index

  def initialize(m, grid)
    @grid = grid
    @bot_index = [(m / 2), (m / 2)]
    @princess_index = []
  end

  def find_princess
    row = @grid.find { |row| row.include?('p') }
    @princess_index = [@grid.index(row), row.index('p')]
  end
end
