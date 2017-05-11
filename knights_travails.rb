require "pry"

class Graph
  attr_accessor :root

  def initialize(data)
    @root = Vertex.new(data)
  end
end

class Vertex
  attr_accessor :data, :parent, :edges

  def initialize(data = nil)
    @data   = data
    @parent = nil
    @edges  = []
  end

  def insert(data)
    vertex = Vertex.new(data)
    vertex.parent = self
    @edges << vertex
  end
end

class Board
  attr_accessor :board

  def initialize
    create_board
  end

  def create_board
    @board = []
    8.times { |x| 8.times { |y| board << [x, y] } }
  end
end

class Knight
  attr_accessor :board, :position

  ALLOWED_MOVES = [[-2, 1], [-1, 2], [2, 1],  [1, 2],
                   [-1, 2], [-2, 1], [-1, 2], [-2, -1]].freeze

  def initialize(position = [0, 0])
    @board    = Board.new
    @position = position
  end

  def move(start, finish)
  end
end

knight = Knight.new
