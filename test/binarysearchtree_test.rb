require './lib/node'
require './lib/binarysearchtree'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'

class BinarySearchTreeTest < Minitest::Test

  def test_root_starts_as_nil
    tree = BinarySearchTree.new
    assert_nil tree.root
  end
  def test_inserting_nodes
    tree = BinarySearchTree.new
    tree.insert(50, "Movie Test")
    assert_equal 50, tree.root.score
  end
  def test_inserting_left_node
    tree = BinarySearchTree.new
    tree.insert(50, "Movie Test")
    tree.insert(25, "Movie Test: The Sequel")
    assert_equal 25, tree.root.left.score
  end
  def test_inserting_right_node
    tree = BinarySearchTree.new
    tree.insert(50, "Movie Test")
    tree.insert(75, "Movie Test: Part Deux")
    assert_equal 75, tree.root.right.score
  end
  def test_depth_return
    tree = BinarySearchTree.new
    result1 = tree.insert(50, "Movie Test")
    result2 = tree.insert(75, "Movie Test: Part Deux")
    assert_equal 0, result1
    assert_equal 1, result2
  end
  def test_inserting_more_than_two_nodes
    tree = BinarySearchTree.new
    tree.insert(50, "Movie Test")
    tree.insert(25, "Movie Test: The Sequel")
    tree.insert(75, "Movie Test: Part Deux")
    tree.insert(60, "Movie Test: The Search for More Money")
    assert_equal 60, tree.root.right.left.score
  end
  def test_depth_of_return
    tree = BinarySearchTree.new
    tree.insert(50, "Movie Test")
    tree.insert(25, "Movie Test: The Sequel")
    tree.insert(75, "Movie Test: Part Deux")
    tree.insert(60, "Movie Test: The Search for More Money")
    assert_equal 0, tree.depth_of?(50)
    assert_equal 1, tree.depth_of?(25)
    assert_equal 1, tree.depth_of?(75)
    assert_equal 2, tree.depth_of?(60)
  end
  def test_min_function
    tree = BinarySearchTree.new
    tree.insert(50, "Movie Test")
    tree.insert(25, "Movie Test: The Sequel")
    tree.insert(75, "Movie Test: Part Deux")
    tree.insert(60, "Movie Test: The Search for More Money")
    expected = {"Movie Test: The Sequel" => 25}
    actual = tree.min
    assert_equal expected, actual
  end
  def test_max_function
    tree = BinarySearchTree.new
    tree.insert(50, "Movie Test")
    tree.insert(25, "Movie Test: The Sequel")
    tree.insert(75, "Movie Test: Part Deux")
    tree.insert(60, "Movie Test: The Search for More Money")
    expected = {"Movie Test: Part Deux" => 75}
    actual = tree.max
    assert_equal expected, actual
  end
  def test_sort_function
    tree = BinarySearchTree.new
    tree.insert(50, "Movie Test")
    tree.insert(25, "Movie Test: The Sequel")
    tree.insert(75, "Movie Test: Part Deux")
    tree.insert(60, "Movie Test: The Search for More Money")
    actual = tree.sort
    expected = [{"Movie Test: The Sequel"=>25}, {"Movie Test"=>50}, {"Movie Test: The Search for More Money"=>60}, {"Movie Test: Part Deux"=>75}]
    assert_equal expected, actual
  end
  # def test_load_function
  #   tree = BinarySearchTree.new
  #
  #
  # end

end
