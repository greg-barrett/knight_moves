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
    @legal_moves=[0, 1, 2, 3, 4, 5, 6, 7,
          10, 11, 12, 13, 14, 15, 16, 17,
          20, 21, 22, 23, 24, 25, 26, 27,
          30, 31, 32, 33, 34, 35, 36, 37,
          40, 41, 42, 43, 44, 45, 46, 47,
          50, 51, 52, 53, 54, 55, 56, 57,
          60, 61, 62, 63, 64, 65, 66, 67,
          70, 71, 72, 73, 74, 75, 76, 77]
  end

  def path
    @route
  end

  def route
    result=""
    @route.each do |x|
      first, second = x.value.to_s.split('')
      second=0 if second ==nil
      result<<"\[#{first},#{second}\] =>"
    end
    puts "You made is in #{@route.length-1} moves!"
    puts result[0..-3]
  end

  def knight_travails(start, finish)
    @nodes<<Node.new(start) if @nodes.length==0
    @head=@nodes[0]
    #create legal children array

    @moves.each do |move|
      if @legal_moves.include?(@head.value+move) && @nodes_visited.include?(@head.value+move)==false
        @child=Node.new(@head.value+move)
        @head.children<<@child
        @child.parent=@head
        @nodes<<@child
        #add_child(finish)
        if @child.value==finish
          until @child==nil
            @route.unshift @child
            @child=@child.parent
          end
        return route
        end
      end
    end
    @oldnode=@nodes.shift
    @nodes_visited<<@oldnode.value
    knight_travails(@nodes, finish)
  end

end

class Board
  def initialize
    @legal_moves=[0, 1, 2, 3, 4, 5, 6, 7,
          10, 11, 12, 13, 14, 15, 16, 17,
          20, 21, 22, 23, 24, 25, 26, 27,
          30, 31, 32, 33, 34, 35, 36, 37,
          40, 41, 42, 43, 44, 45, 46, 47,
          50, 51, 52, 53, 54, 55, 56, 57,
          60, 61, 62, 63, 64, 65, 66, 67,
          70, 71, 72, 73, 74, 75, 76, 77]
  end

  def create_grid
    @hash=Hash.new
    @legal_moves.each do |x|
      @hash[x]="   "
    end
  end

  def route_hash(route)
    route.each do |x|
      @hash[x.value]=" K "
    end
  end

  def show_hash
    puts " _______________________________"
    puts "|#{@hash.fetch_values(70, 71, 72, 73, 74, 75, 76, 77).join("|")}|"
    puts " _______________________________"
    puts "|#{@hash.fetch_values(60, 61, 62, 63, 64, 65, 66, 67).join("|")}|"
    puts " _______________________________"
    puts "|#{@hash.fetch_values(50, 51, 52, 53, 54, 55, 56, 57).join("|")}|"
    puts " _______________________________"
    puts "|#{@hash.fetch_values(40, 41, 42, 43, 44, 45, 46, 47).join("|")}|"
    puts " _______________________________"
    puts "|#{@hash.fetch_values(30, 31, 32, 33, 34, 35, 36, 37).join("|")}|"
    puts " _______________________________"
    puts "|#{@hash.fetch_values(20, 21, 22, 23, 24, 25, 26, 27).join("|")}|"
    puts " _______________________________"
    puts "|#{@hash.fetch_values(10, 11, 12, 13, 14, 15, 16, 17).join("|")}|"
    puts " ________________________________"
    puts "|#{@hash.fetch_values(0, 1, 2, 3, 4, 5, 6, 7).join("|")}|"
    puts " _______________________________"
  end
end

tree=Tree.new
tree.knight_travails(0,13)
board=Board.new
board.create_grid
board.route_hash(tree.path)
board.show_hash
