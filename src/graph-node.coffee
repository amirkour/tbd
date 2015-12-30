###
GraphNode

A node in a graph in x-y space
###
GraphNode = (options) ->
    @x = if options && options.x then options.x else 0
    @y = if options && options.y then options.y else 0
    return # have to explicitly return, otherwise options.y will get returned
           # when present, instead of 'this'

###
is_left_neighbor_of

return true if this node is to the immediate left of the
given neighbor, false otherwise (also, false if the given
neighbor isn't a GraphNode.)

eg: x (at 1,1) is considered to be the left-neighbor of
y (at 2,1) in the given grid:

  | 0 1 2 3
-----------
0 | . . . .
1 | . x y .
2 | . . . .
###
GraphNode.prototype.is_left_neighbor_of = (neighbor) ->
    return false unless neighbor instanceof GraphNode
    
    return (this.x is neighbor.x - 1) and (this.y is neighbor.y)

###
is_right_neighbor_of

return true if this node is to the immediate right of the
given neighbor, false otherwise (also, false if the given
neighbor isn't a GraphNode.)

eg: x (at 2,1) is considered to be the right-neighbor of
y (at 1,1) in the given grid:

  | 0 1 2 3
-----------
0 | . . . .
1 | . y x .
2 | . . . .
###
GraphNode.prototype.is_right_neighbor_of = (neighbor) ->
    return false unless neighbor instanceof GraphNode
    
    return (this.x is neighbor.x + 1) and (this.y is neighbor.y)

###
is_top_neighbor_of

return true if this node is to the immediate top of the
given neighbor, false otherwise (also, false if the given
neighbor isn't a GraphNode.)

eg: x (at 1,0) is considered to be the top-neighbor of
y (at 1,1) in the given grid:

  | 0 1 2 3
-----------
0 | . x . .
1 | . y . .
2 | . . . .
###
GraphNode.prototype.is_top_neighbor_of = (neighbor) ->
    return false unless neighbor instanceof GraphNode
    
    return (this.x is neighbor.x) and (this.y is neighbor.y - 1)

###
is_bottom_neighbor_of

return true if this node is to the immediate bottom of the
given neighbor, false otherwise (also, false if the given
neighbor isn't a GraphNode.)

eg: x (at 1,2) is considered to be the bottom-neighbor of
y (at 1,1) in the given grid:

  | 0 1 2 3
-----------
0 | . . . .
1 | . y . .
2 | . x . .
###
GraphNode.prototype.is_bottom_neighbor_of = (neighbor) ->
    return false unless neighbor instanceof GraphNode
    
    return (this.x is neighbor.x) and (this.y is neighbor.y + 1)


###
is_neighbor_to

helper that returns true if the given GraphNode or x,y coordinates
are a neighbor to this node, false otherwise.
###
GraphNode.prototype.is_neighbor_to = (x,y) ->
    neighbor = null
    if typeof x is 'number'
        throw new Error("x and y must both be numbers - x was a number, but y was not!?") unless typeof y is 'number'
        neighbor = new GraphNode({x:x,y:y})
    else if x instanceof GraphNode
        neighbor = x
    else
        return false

    return this.is_left_neighbor_of(neighbor) or
           this.is_right_neighbor_of(neighbor) or
           this.is_top_neighbor_of(neighbor) or
           this.is_bottom_neighbor_of(neighbor)

###
equals

returns true if the given object is a GraphNode that is
equivalent to this one, false otherwise.
###
GraphNode.prototype.equals = (other) ->
    return false if other not instanceof GraphNode

    return other.x is @x and other.y is @y

module.exports = GraphNode
