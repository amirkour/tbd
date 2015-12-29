
GraphNode = (options) ->
    @x = if options && options.x then options.x else 0
    @y = if options && options.y then options.y else 0
    return # have to explicitly return, otherwise options.y will get returned
           # when present, instead of 'this'

GraphNode.prototype.equals = (other) ->
    return false if other not instanceof GraphNode

    return other.x is @x and other.y is @y

module.exports = GraphNode
