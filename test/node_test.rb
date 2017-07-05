require './lib/node'
require './lib/binarysearchtree'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'

class NodeTest < Minitest::Test
  def test_node_new_node_has_score
    node = Node.new(99, "Movie Test")
    assert_equal 99, node.score
  end
  def test_node_new_node_has_title
    node = Node.new(99, "Movie Test")
    assert_equal "Movie Test", node.title
  end
  def test_node_new_node_has_left_starts_as_nil
    node = Node.new(99, "Movie Test")
    assert_equal nil, node.left
  end
  def test_node_new_node_has_right_starts_as_nil
    node = Node.new(99, "Movie Test")
    assert_equal nil, node.right
  end
end
