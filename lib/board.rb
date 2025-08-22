require 'rainbow/refinement'
using Rainbow

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

  def get_cell(xd, yd)
    @cells[xd][yd]
  end

  def four_row?(row, color)
    row_arr = @cells[row]
    row_arr.length.times do |i|
      if row_arr[i].color == color &&
         row_arr[i + 1].color == color &&
         row_arr[i + 2].color == color &&
         row_arr[i + 3].color == color
        return true
      end
    end
    false
  end

  def four_column?(column, color)
    column_arr = @cells.map do |xd|
      xd[column]
    end
    column_arr.length.times do |i|
      if column_arr[i].color == color &&
         column_arr[i + 1].color == color &&
         column_arr[i + 2].color == color &&
         column_arr[i + 3].color == color
        return true
      end
    end
    false
  end

  def diagonals
    diags = []
    (0..@row - 4).each do |i|
      (0..@column - 4).each do |j|
        diags << (0..3).map do |k|
          @cells[i + k][j + k]
        end
      end
    end
    diags
  end

  def four_diagonal?(color)
    diagonals.any? do |diag|
      diag.each_cons(4).any? { |group| group.all? { |cell| cell.color == color } }
    end
  end

  def render
    system('clear') || system('cls')

    @cells.reverse_each.with_index do |row, y|
      print (@row - 1 - y).to_s.ljust(3) # row numbers
      row.each do |cell|
        symbol = 'O'
        if cell.color == :red
          print " #{symbol.color(:red)} "
        elsif cell.color == :yellow
          print " #{symbol.color(:yellow)} "
        else
          print ' . '
        end
      end
      print "\n"
    end
    puts '   ' + (0...@column).map { |c| c.to_s.center(3) }.join # column numbers
  end
end

class Cell
  attr_reader :xd, :yd, :color

  def initialize(xd, yd, color = nil)
    @xd = xd # column
    @yd = yd # row
    @color = color
    @value = 'O'
  end

  def show_cords
    @cords
  end

  def change_color(color)
    @color = color
  end
end
