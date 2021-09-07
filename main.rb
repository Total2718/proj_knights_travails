#knights travails 


class KnightPath
    attr_accessor :position, :parent

    TRANSFORMATIONS = [[1,2], [2,1], [-1,2], [2,-1],
                         [-2,1], [-1,-2], [-2,-1], [1,-2]].freeze
    @@history = []

    def initialize(position, parent)
        @parent = parent
        @position = position
        @@history.push(position)
    end

    def children
       pos_mov = TRANSFORMATIONS.map do |transf|
        x = @position[0] + transf[0]
        y = @position[1] + transf[1]
                new_spot = [x, y]
       end
       pos_mov.keep_if{|spot| spot[0].between?(0, 7) && spot[1].between?(0, 7)}
       m = pos_mov.reject { |e| @@history.include?(e) }
       m.map {|e| KnightPath.new(e, self)}

       
    end

end

def knight_moves(start_pos, end_pos)
    queue = []
    current_node = KnightPath.new(start_pos, nil)
    until current_node.position == end_pos
        current_node.children.each do |child| 
            queue.push(child)
            
        end
        current_node = queue.shift
    end
    identify_path(current_node)
end

def identify_path(node)
    
    identify_path(node.parent) unless node.parent.nil?
    
    print node.position[0]
    print " "
    puts node.position[1]

end

knight_moves([4,5], [5,5])
