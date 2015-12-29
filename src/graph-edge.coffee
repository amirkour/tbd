###
GraphEdge

Represents an undirected edge in a graph.  Note that an undirected
edge makes no sense w/o exactly 2 graph nodes to define it.
###
GraphNode = require './graph-node'

GraphEdge = (options) ->
    this.node_one = if options and options.node_one then options.node_one else null
    this.node_two = if options and options.node_two then options.node_two else null
    this # this was a weird bug - in the cases when options.node_two is a GraphNode,
         # if you don't explicitly return 'this', then options.node_two was getting
         # returned (instead of this) ... so, just gonna explicitly return 'this' for now

###
equals

Test edge equality - note that an undirected edge is equal to another
undirected edge iff the nodes of both edges are equal, regardless
of their order.  If either edge does not have two nodes, equality
makes no sense - an undirected edge can't exist w/o 2 nodes!
###
GraphEdge.prototype.equals = (other) ->
    return false if other not instanceof GraphEdge
    return false unless other.node_one instanceof GraphNode
    return false unless other.node_two instanceof GraphNode
    return false unless this.node_one instanceof GraphNode
    return false unless this.node_two instanceof GraphNode

    return ((this.node_one.equals(other.node_one) and this.node_two.equals(other.node_two)) or
            (this.node_two.equals(other.node_one) and this.node_one.equals(other.node_two)))


module.exports = GraphEdge
