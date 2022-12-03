require 'pry'
# attr_reader :bot_index, :princess_index

@bot_index = []
@princess_index = []

def displayPathtoPrincess(m, grid)
  bot_starting_postion(m, grid)
  princess_location(m, grid)
  until @bot_index == @princess_index
    if @bot_index[0] < @princess_index[0]
      @bot_index[0] += 1
      puts "DOWN"
    else
      @bot_index[0] -= 1
      puts "UP"
    end
    if @bot_index[1] < @princess_index[1]
      @bot_index[1] += 1
      puts "RIGHT"
    else
      @bot_index[1] -= 1
      puts "LEFT"
    end
  end
  return ""
end

private

def bot_starting_postion(m, grid)
  location = grid.index(grid.find { |row| row.include?("m") })
  @bot_index = [location, location]
end

def princess_location(m, grid)
  row = grid.find { |row| row.include?("p") }
  @princess_index = [grid.index(row), row.index("p")]
end
