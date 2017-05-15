# Ruby Knight's Travails

Find the shortest path for a knight crossing a chessboard.

This is a project for the Data Structures and Algorithms lesson of [The Odin Project](https://www.theodinproject.com/courses/ruby-programming/lessons/data-structures-and-algorithms).

It may be run with `ruby knights_travails.rb`

## Task Instructions

Your task is to build a function `knight_moves` that shows the simplest possible way to get from one square to another by outputting all squares the knight will stop on along the way.

You can think of the board as having 2-dimensional coordinates. Your function would therefore look like:

- `knight_moves([0,0],[1,2]) == [[0,0],[1,2]]`
- `knight_moves([0,0],[3,3]) == [[0,0],[1,2],[3,3]]`
- `knight_moves([3,3],[0,0]) == [[3,3],[1,2],[0,0]]`

1. Put together a script that creates a game board and a knight.
2. Treat all possible moves the knight could make as children in a tree. Don't allow any moves to go off the board.
3. Decide which search algorithm is best to use for this case. Hint: one of them could be a potentially infinite series.
4. Use the chosen search algorithm to find the shortest path between the starting square (or node) and the ending square. Output what that full path looks like, e.g.:

```
  > knight_moves([3,3],[4,3])
  You made it in 3 moves!  Here's your path:
  [3,3]
  [4,5]
  [2,4]
  [4,3]
```
