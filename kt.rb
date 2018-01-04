
class Node
    attr_accessor :value, :children, :parent

    def initialize(value=nil, children=[], parent=nil)
      @value=value
      @children=children
      @parent=parent
    end

end

class Tree
  def initialize
    @route=[]
    @nodes=[]
    @nodes_visited=[]
    @moves=[21, 19, 12, 8, -8, -12, -19, -21]
  end

  def nodes
    @nodes
  end

  def legal_moves
    @legal_moves=[0, 1, 2, 3, 4, 5, 6, 7,
          10, 11, 12, 13, 14, 15, 16, 17,
          20, 21, 22, 23, 24, 25, 26, 27,
          30, 31, 32, 33, 34, 35, 36, 37,
          40, 41, 42, 43, 44, 45, 46, 47,
          50, 51, 52, 53, 54, 55, 56, 57,
          60, 61, 62, 63, 64, 65, 66, 67,
          70, 71, 72, 73, 74, 75, 76, 77]
    end

  def knight_travails(start, finish)
    #initial node creation
        if @nodes.length==0
          @nodes<<Node.new(start)
          @head=@nodes[0]
        end
        @head=@nodes[0]

    #end retun
    if @head.value==finish
      puts "hurray"
      return @route
    else
    #create legal children array
    @moves.each do |move|
      if @legal_moves.include?(@head.value+move)
        if @nodes_visited.include?(@head.value+move)==false
          child=Node.new(@head.value+move)
          @head.children<<child
          @head.children.last.parent=@head
          @nodes<<child
          @end=@nodes[-1]
          if @end.value==finish
            until @end==nil
            @route<<@end
            @end=@end.parent
          end
          @route.each do |z|
            print z.value
          end
          return
          end
        end
                            @nodes.each do |z|
                              puts z.value
                            end
                            puts ""
      end
    end
  @oldnode=@nodes.shift
  @nodes_visited<<@oldnode.value

  @route<<knight_travails(@nodes, finish)
end
end


end


=begin
    elsif value > original.value && original.right == nil
      original.right= node=Node.new(value)
      node.parent= original
      @nodes_array<<node
    elsif value <= original.value && original.left != nil
      make_tree(value, original.left)
    elsif value > original.value && original.right != nil
      make_tree(value, original.right)
    end
  end
end
=end

tree=Tree.new
tree.legal_moves
tree.knight_travails(77,70)
