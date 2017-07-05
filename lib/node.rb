# /lib/node.rb
class Node
    attr_accessor :score, :title, :left, :right
    # The Tree node contains a value, and a pointer to two children - left and right
    # Values lesser than this node will be inserted on its left
    # Values greater than it will be inserted on its right
    def initialize(score, title)
        @score = score
        @title = title
        @left = nil
        @right = nil
    end
end
