
cells = [['.','.','*','.'], ['*','.','.','.'], ['.','.','.','.'], ['.','*','.','.']]

# ..*.
# *...
# ....
# .*..

# read file from command line
file = File.open("../#{ENV['MINEFIELD']}")
board = Board.new(file)
board.cli_print

class Cell
  def initialize(string)
    @is_bomb = string == '*'
  end
end

class Board
  attr_reader :columns, :rows

  def initialize(columns, rows, cells_string)
  @columns = columns
  @rows = rows
  cells_string.each { |cell| Cell.new(cell) }

  cells.each.with_index do |row, x|
    row.each.with_index do |cell, y|
      puts "Cell: #{cell}, coordinates: #{x} #{y}"
      # cell.number_of_neighbors = self.neighbors_of(x,y).select {|neighbor| neighbor.is_bomb? }.size
      end
    end
  end


  def self.neighbors_of(x, y)
    neighbors = []
    neighbors << cells[x-1][y-1] unless x == 0 || y == 0      
    neighbors << cells[x-1][y] unless x == 0
    neighbors << cells[x-1][y+1] unless x == 0 || y == 
    neighbors << cells[x][y] unless
    neighbors << cells[x][y] unless
    neighbors << cells[x+1][y] unless
    neighbors << cells[x+1][y] unless
    neighbors << cells[x+1][y] unless
  end

  def cli_print
    # print expected output to command line
  end
end


  surroundingBombs = 0
  rowPosition = cell.index(row)
  if cell.isBomb
    return '*'
  else
    if cell.firstInRow
      if rowPosition == 0

        # surroundingBombs << row[1]
        # surroundingBombs << cells[rowPosition + 1][0]
        # surroundingBombs << cells[rowPosition + 1][1]
      elsif rowPosition == 4
        surroundingBombs << row[1]
        surroundingBombs << cells[rowPosition - 1][0]
        surroundingBombs << cells[rowPosition - 1][1]        
      end
      # check first two positions above, around, below
    elsif cell.lastInRow
      # check last two positions above, around, below
    else
      # check itself and left/right above, around, below
  end
end

