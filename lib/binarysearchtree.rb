# /lib/binarsearchtree.rb
require './lib/node'
require 'pry'

class BinarySearchTree

  attr_accessor :root

  def initialize
    @root = nil
  end
# -------------------INSERT-----------
  def insert(score, title)
    depth = 0
    if @root.nil?
      @root = Node.new(score, title)
      return depth
    else
      current = @root
      done = false
      until done
        depth += 1
        if score < current.score
          if current.left.nil?
            current.left = Node.new(score, title)
            done = true
          else
            current = current.left
        #    depth =+ 1
          end
        elsif score > current.score
          if current.right.nil?
            current.right = Node.new(score, title)
            done = true
          else
            current = current.right
          #  depth += 1
          end
        else
            done = true
            return "This score is already in the database, select another."
        end
      end
      depth
    end
  end
  # ------------------------------
  def include?(score, current = @root)
    return false if current.nil?
    return true if score == current.score
    return false if score < current.score && current.left.nil?
    return false if score > current.score && current.right.nil?
    # traversal
    if score < current.score
      include?(score, current.left)
    else
      include?(score, current.right)
    end
  # Verify/reject the presence of a score in the tree:
  # tree.include?(92)
  #       => true
  end
# ------------------------------------
  def depth_of?(score, current = @root, depth = 0)
    return nil if current.nil?
    return depth if score == current.score
    return nil if score < current.score && current.left.nil?
    return nil if score > current.score && current.right.nil?
      if score < current.score
        depth_of?(score, current.left, depth + 1)
      else
        depth_of?(score, current.right, depth + 1)
      end
  #Reports the depth of the tree where a score appears. Return nil
  #if the score does not exist:
  # tree.depth_of(92)
  #         => 1
  end

  def max
    current = @root
    until current.right.nil?
      current = current.right
    end
    {current.title => current.score}
  # Which movie has the highest score in the list? What is it’s score?
  #     tree.max
  #       => {"Sharknado 3"=>92}
  end

  def min
    # add additional checks for nil root
    current = @root
    until current.left.nil?
      current = current.left
    end
    {current.title => current.score}
  # Which movie has the lowest score in the list? What is it’s score?
  end

  def sort(current = @root, movies = [])
    return "No Data" unless current
    return if current.nil?
    sort(current.left, movies)
      movies << {current.title => current.score}
    sort(current.right, movies)
      movies
  #Return an array of all the movies and scores in sorted ascending order.
  #Return them as an array of hashes. Note: you’re not using Ruby’s
  #Array#sort. You’re traversing the tree.
  end

  def load(file)
    File.open(file).readlines.each do | line |
      data = line.strip.split(", ", 2)
      if include?(data[0].to_i,) == true
        puts "#{data[1]} already exists at position #{data[0]}"
      else
        insert(data[0].to_i, data[1])
      end
  #Assuming we have a file named movies.txt with one score/movie pair per
  #line:
    end
  end

  def health(depth, current = @root, movies = [])
    return if current.nil?
    health(depth, current.left, movies)
    movies = format_health(depth, current. movies)
    health(depth, current.right, movies)
    movies
  end

  def format_health(depth, current, movies)
    if depth_of?(current.score) >= depth
    total_count = count_nodes(@root)
    node_count = current_nodes(current)
    movies << [current.score, node_count, percentage_of_tree(total_count, node_count)]
    end
    movies
  end

  def percentage_of_tree(total_count, node_count)
    (node_count.to_f / total_count.to_f * 100).to_i
  end
end

tree = BinarySearchTree.new
tree.insert(50, "Movie Test")
tree.insert(25, "Movie Test: The Sequel")
tree.insert(75, "Movie Test: Part Deux")
tree.insert(60, "Movie Test: The Search for More Money")
tree.insert(85, "Movie Test: Depth 2")
tree.insert(90, "Movie Test: Depth 3")
# tree.load("test/movies.txt")
# puts "tree.min"
puts tree.min
puts tree.sort
# puts "tree.max"
# puts tree.max
# # puts tree.sort
# puts tree.root.score
# puts tree.health(2)
# puts tree.sort(75)
