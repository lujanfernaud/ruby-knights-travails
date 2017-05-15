class Graph
  attr_reader :root, :board

  def initialize(data)
    @root  = Vertex.new(data: data)
    @board = Board.new
  end

  def traverse(to, allowed_moves)
    build_graph(to, allowed_moves)
  end

  private

  def build_graph(to, allowed_moves)
    root.add_neighbors(board, root, to, allowed_moves)
  end
end

class Vertex
  attr_accessor :data, :parent, :neighbors

  def initialize(data: nil, parent: nil)
    @data      = data
    @parent    = parent
    @neighbors = {}
  end

  def add_neighbors(board, from, to, allowed_moves)
    queue = [self]

    until queue.empty?
      current = queue.shift
      return current.trace_path(from) if current.data == to
      destinations = board.possible_destinations(current.data, allowed_moves)
      destinations.each(&add_vertex(board, current, queue))
    end
  end

  protected

  def trace_path(from)
    path    = []
    current = self

    loop do
      path << current.data
      return print_result(path) if current == from
      current = current.parent
    end
  end

  def print_result(path)
    puts "You made it in #{path.length - 1} moves! Here's your path:"
    puts "#{path.reverse}"
  end

  def add_vertex(board, current, queue)
    proc do |destination|
      board.visited << destination
      vertex = Vertex.new(data: destination, parent: current)
      current.neighbors[destination] = vertex
      queue << vertex
    end
  end
end

class Board
  attr_accessor :board, :visited

  def initialize
    @board   = Array.new { 8.times { |x| 8.times { |y| [x, y] } } }
    @visited = []
  end

  def possible_destinations(position, allowed_moves)
    possible_moves = possible_moves(position, allowed_moves)
    destination = proc { |move| [move[0] + position[0], move[1] + position[1]] }
    possible_moves.map(&destination).uniq - visited
  end

  private

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
    @allowed_moves = [[-2, 1],  [-1, 2],  [1, 2],  [2, 1],
                      [-2, -1], [-1, -2], [1, -2], [2, -1]].freeze
  end

  def move(from, to)
    graph = Graph.new(from)
    graph.traverse(to, allowed_moves)
  end
end

def knight_moves(*args)
  knight = Knight.new
  knight.move(args[0], args[1])
end

knight_moves([3, 3], [4, 3])

# Board representation:
#
# [[0, 0], [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7],
#  [1, 0], [1, 1], [1, 2], [1, 3], [1, 4], [1, 5], [1, 6], [1, 7],
#  [2, 0], [2, 1], [2, 2], [2, 3], [2, 4], [2, 5], [2, 6], [2, 7],
#  [3, 0], [3, 1], [3, 2], [3, 3], [3, 4], [3, 5], [3, 6], [3, 7],
#  [4, 0], [4, 1], [4, 2], [4, 3], [4, 4], [4, 5], [4, 6], [4, 7],
#  [5, 0], [5, 1], [5, 2], [5, 3], [5, 4], [5, 5], [5, 6], [5, 7],
#  [6, 0], [6, 1], [6, 2], [6, 3], [6, 4], [6, 5], [6, 6], [6, 7],
#  [7, 0], [7, 1], [7, 2], [7, 3], [7, 4], [7, 5], [7, 6], [7, 7]]
