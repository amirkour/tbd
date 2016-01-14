GraphUtils = require './graph-utils'

###
GraphEdge

Represents an undirected edge in a graph.  Note that an undirected
edge makes no sense w/o exactly 2 graph nodes to define it.
###
GraphNode = require './graph-node'

GraphEdge = (options) ->
    @node_one = if options and options.node_one then options.node_one else null
    @node_two = if options and options.node_two then options.node_two else null
    return # this was a weird bug - in the cases when options.node_two is a GraphNode,
           # if you don't explicitly return, then options.node_two was getting
           # returned (instead of this) ... so, just gonna explicitly return

###
equals

Test edge equality - note that an undirected edge is equal to another
undirected edge iff the nodes of both edges are equal, regardless
of their order.  If either edge does not have two nodes, equality
makes no sense - an undirected edge can't exist w/o 2 nodes!
###
GraphEdge.prototype.equals = (other) ->
    return false unless GraphUtils.quacks_like_a_graph_edge(other)
    return false unless GraphUtils.quacks_like_a_graph_node(@node_one)
    return false unless GraphUtils.quacks_like_a_graph_node(@node_two)

    return ((@node_one.equals(other.node_one) and @node_two.equals(other.node_two)) or
            (@node_two.equals(other.node_one) and @node_one.equals(other.node_two)))


module.exports = GraphEdge
