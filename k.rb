
class Node
    attr_accessor :value, :down, :right
    def initialize(value=nil, down=nil, right=nil)
      @value=value
      @down=down
      @right=right
    end
end

class Tree
  def initialize
    @nodes=[]
    @values=[]
    @moves=[21, 19, 12, 8, -8, -12, -19, -21]
  end

  def nodes_array
    @nodes
  end

  def make_nodes(array)
    array.each do |num|
      node=Node.new(num)
      @nodes<<node
    end
  end

  def set_right
    it=1
    @nodes.each do |node|
      node.right=@nodes[it]
      it+=1
    end
    @nodes.last.right=@nodes[0]
  end

  def set_values_array
    @nodes.each do |num|
      @values<<num.value
    end
  end

  def values
    @values
  end

  def possible_moves
    @nodes.each do |node|
      ref=node.value
      @top=node
        @moves.each do |move|
          square=ref+move
          if @values.include?(square)
            @top.down=Node.new(square)
            @top.down.value
            @top=@top.down
          end
        end
      end
    end

  def knight_moves(first, last)
    first=first.join.to_i
    last=last.join.to_i
  end

end

grid=[0, 1, 2, 3, 4, 5, 6, 7,
      10, 11, 12, 13, 14, 15, 16, 17,
      20, 21, 22, 23, 24, 25, 26, 27,
      30, 31, 32, 33, 34, 35, 36, 37,
      40, 41, 42, 43, 44, 45, 46, 47,
      50, 51, 52, 53, 54, 55, 56, 57,
      60, 61, 62, 63, 64, 65, 66, 67,
      70, 71, 72, 73, 74, 75, 76, 77]
tree=Tree.new
tree.make_nodes(grid)
tree.set_right
tree.set_values_array
puts tree.possible_moves
