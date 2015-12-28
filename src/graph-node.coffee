
GraphNode = (options) ->
    this.x = if options && options.x then options.x else 0
    this.y = if options && options.y then options.y else 0

GraphNode.prototype.equals = (other) ->
    return false if other not instanceof GraphNode

    return other.x is this.x and other.y is this.y

module.exports = GraphNode
