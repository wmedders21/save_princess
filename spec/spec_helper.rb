class SpecHelper
  def self.make_grids(size)
    collection = []
    grid = Array.new(size - 2)
    grid.fill("-" * size)
    grid.prepend("p" + "-" * (size - 1))
    grid.insert((size / 2), "-" * (size / 2) + "m" + "-" * (size / 2))
    grid.map! { |row| row.chars }
    collection << grid
    collection << grid.reverse
    collection << grid.map { |row| row.include?("p") ? row.reverse : row }
    collection << grid.reverse.map { |row| row.include?("p") ? row.reverse : row }
    collection.map { |grid| grid.map { |row| row.join } }
  end
end