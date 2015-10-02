class Cell
  def initialize(string)
    @is_bomb = string == '*'
  end
end

class Board
  attr_reader :num_columns, :num_rows, :rows

  def initialize(board_data)
    string_rows = board_data.split("\n")
    board_dimensions = string_rows.shift
    @num_columns = board_dimensions[0]
    @num_rows = board_dimensions[2]

    # TODO: clean up this brute force mess
    @rows = []
    string_rows.collect do |row|
      row_of_cells = []
      row.each_char { |cell| row_of_cells << Cell.new(cell) }
      rows << row_of_cells
    end
    rows.each_with_index do |row, x|
      row.each_with_index do |cell, y|
        puts "Cell: #{cell}, coordinates: #{x} #{y}"
        # cell.number_of_neighbors = self.neighbors_of(x,y).select {|neighbor| neighbor.is_bomb? }.size
      end
    end
  end

  def self.neighbors_of(x, y)
    # TODO: complete neighbor logic
    neighbors = []
    neighbors << cells[x-1][y-1] unless x == 0 || y == 0      
    neighbors << cells[x-1][y] unless x == 0
    neighbors << cells[x-1][y+1] #unless x == 0 || y == 
    # # neighbors << cells[x][y] unless
    # neighbors << cells[x][y] unless
    # neighbors << cells[x+1][y] unless
    # neighbors << cells[x+1][y] unless
    # neighbors << cells[x+1][y] unless
  end

  def cli_print
    # TODO
    # print expected output to command line
  end
end

file = File.open("#{ENV['MINEFIELD']}").read
board = Board.new(file)
board.cli_print
