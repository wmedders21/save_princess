require 'pry'

class SavePrincess
  attr_reader :bot_index, :princess_index

  def initialize
    @bot_index = []
    @princess_index = []
  end

  def displayPathtoPrincess(m, grid)
    # binding.pry
    return ""
  end

  def bot_starting_postion(m, grid)
    location = grid.index(grid.find { |row| row.include?("m") })
    @bot_index = [location, location]
  end

  def princess_location(m, grid)
    row = grid.find { |row| row.include?("p") }
    @princess_index << grid.index(row)
    @princess_index << row.index("p")
  end
end