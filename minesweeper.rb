require 'pry'

class Cell
  attr_accessor :number_of_neighbors
  attr_reader :is_bomb
    
  def initialize(string)
    @is_bomb = string == '*'
  end

  def is_bomb?
    is_bomb   
  end

  def to_s
    if is_bomb
      '*'
    else
      number_of_neighbors
    end
  end
end

class Board
  attr_reader :num_columns, :num_rows, :rows

  def initialize(board_data)
    string_rows = board_data.split("\n")
    board_dimensions = string_rows.shift
    @num_columns = board_dimensions[0].to_i
    @num_rows = board_dimensions[2].to_i
    # TODO: clean up this brute force mess
    @rows = []
    string_rows.collect do |row|
      row_of_cells = []
      row.each_char { |cell| row_of_cells << Cell.new(cell) }
      @rows << row_of_cells
    end
  end

  def build
    rows.each_with_index do |row, x|
      row.each_with_index do |cell, y|
        all_neighbors = neighbors_of(x,y)
        cell.number_of_neighbors = all_neighbors.select {|neighbor| neighbor.is_bomb? }.size
      end
    end
  end

  def neighbors_of(x, y)
    neighbors = []
    neighbors << rows[x-1][y-1] unless x == 0 || y == 0      
    neighbors << rows[x-1][y] unless x == 0
    neighbors << rows[x-1][y+1] unless x == 0 || y == last_column
    neighbors << rows[x][y-1] unless y == 0
    neighbors << rows[x][y+1] unless y == last_column
    neighbors << rows[x+1][y-1] unless x == last_row || y == 0
    neighbors << rows[x+1][y] unless x == last_row
    neighbors << rows[x+1][y+1] unless x == last_row || y == last_column
    neighbors
  end

  def last_column
    num_columns - 1
  end

  def last_row
    num_rows - 1
  end

  def to_s
    rows.map {|row| row.map {|cell| cell.to_s }.join() }.join("\n")
  end
end

file = File.open("#{ENV['MINEFIELD']}").read
board = Board.new(file)
board.build
puts board.to_s
