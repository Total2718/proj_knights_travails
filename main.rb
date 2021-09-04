#knights travails 


class KnightPath

    TRANSFORMATIONS = [[1,2], [2,1], [-1,2], [2,-1],
                         [-2,1], [-1,-2], [-2,-1], [1,-2]].freeze
    @@history = []

    def initialize(position, parent = nil )
        @parent = parent
        @position = position
        @@history.push(position)
    end

    def children()
       pos_mov = TRANSFORMATIONS.map do |transf|
        x = @position[0] + transf[0]
        y = @position[1] + transf[1]
            if (x >= 0 && x <= 7) && (y >= 0 && y <= 7)
                new_spot = [x, y]
            end
       end
       new_spot.map do |spot|
        if @@history.include? (spot) == false
            KnightPath.new(spot, @position)
        end
       end
       
    end

end

def knight_moves(start_pos, end_pos)
    queue = []
    current_node = KnightPath.new(start_pos)
    until current_node.position == end_pos
        current_node.children.each {|child| queue.push(child)}
end


