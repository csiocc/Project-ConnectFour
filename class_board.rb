class Board
  attr_reader :row, :column, :cells

  def initialize(rows = 6, columns = 7)
    @row = rows
    @column = columns
    @cells = []
  end

  def setup
    @cells = Array.new(@row) do |yd|
      Array.new(@column) do |xd|
        Cell.new(xd, yd)
      end
    end
  end

  def show_cells
    @cells
  end
end

class Cell
  attr_reader :xd, :yd, :color

  def initialize(xd, yd, color = nil)
    @xd = xd
    @yd = yd
    @color = color
  end

  def show_cords
    @cords
  end
end

play = Board.new
play.setup
p play.cells
