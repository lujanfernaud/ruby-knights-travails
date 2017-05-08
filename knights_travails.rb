require "pry"

class Board
  attr_accessor :matrix

  def initialize
    # @matrix = Array.new(8) { Array.new(8) { 0 } }
    @matrix = Array.new(8) { [1, 2, 3, 4, 5, 6, 7, 8] }
    create_graph
  end

  def create_graph
    @matrix.each do |x|
      x.each do |y|
        vertex = Vertex.new(y)
        x[x.index(y)] = vertex
      end
    end

    @matrix.each do |x|
      x.each do |y|
        vertex = y
        add_edges(vertex, @matrix.index(x), x.index(y))
      end
    end
  end

  def add_edges(vertex, x, y)
    vertex.edges << @matrix[x + 1][y] if x >= 0 && x <= 6
    vertex.edges << @matrix[x - 1][y] if x >= 1 && x <= 7
    vertex.edges << @matrix[x][y + 1] if y >= 0 && y <= 6
    vertex.edges << @matrix[x][y - 1] if y >= 1 && y <= 7
  end
end

class Vertex
  attr_accessor :value, :edges

  def initialize(value = nil, edges = [])
    @value = value
    @edges = edges
  end
end

class Knight
  attr_accessor :board

  def initialize
    @board = Board.new
  end

  def move(start, finish)
  end
end

board = Board.new
