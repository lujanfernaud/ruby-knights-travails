require "pry"

class Graph
  attr_accessor :root

  def initialize(data)
    @board = Board.new
    @root  = Vertex.new(data)
  end

  def traverse(finish, allowed_moves)
    @root.add_children(@board, finish, allowed_moves)
  end
end

class Vertex
  attr_accessor :data, :parent, :children

  def initialize(data = nil)
    @data      = data
    @parent    = nil
    @children  = {}
  end

  def insert(data)
    vertex = Vertex.new(data)
    vertex.parent = self
    @children[data] = vertex
  end

  # def add_children(board, finish, allowed_moves)
  #   destinations = board.possible_destinations(data, allowed_moves)
  #   destinations.each do |destination|
  #     vertex = Vertex.new
  #     vertex.parent = self
  #     @children[destination] = vertex
  #   end
  # end

  def add_children(board, finish, allowed_moves)
    # return if data == finish

    # binding.pry

    # destinations = board.possible_destinations(data, allowed_moves)
    # destinations.each do |destination|
    #   vertex = Vertex.new
    #   vertex.parent = self
    #   @children[destination] = vertex
    #   vertex.add_children(board, finish, allowed_moves)
    # end
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

  def possible_destinations(position, allowed_moves)
    possible_moves = possible_moves(position, allowed_moves)
    destination = proc { |move| [move[0] + position[0], move[1] + position[1]] }
    possible_moves.map(&destination)
  end

  def possible_moves(position, allowed_moves)
    allowed_moves.select do |move|
      x = position[0] + move[0]
      y = position[1] + move[1]
      board_size = 0..7
      board_size.cover?(x) && board_size.cover?(y)
    end
  end
end

class Knight
  attr_reader :allowed_moves

  def initialize
    @allowed_moves = [[-2, 1], [-1, 2], [2, 1], [1, 2],
                      [-1, 2], [-2, 1], [-1, 2], [-2, -1]].freeze
  end

  def move(start, finish)
    graph = Graph.new(start)
    graph.traverse(finish, allowed_moves)
  end
end

knight = Knight.new
knight.move([2, 7], [0, 2])
