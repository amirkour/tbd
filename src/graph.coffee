GraphNode = require './graph-node'
GraphEdge = require './graph-edge'

###
Graph

Defines a basic, non-directed graph
###
Graph = (options) ->
    options = options or {};
    @nodes = (options.nodes or [])
    @edges = (options.edges or [])
    return # again, need to explicitly return here, because when options.edges
           # actually contains something non-null, it's being returned instead
           # of 'this'

###
add_node

add the given node, only if it's a GraphNode, and return this
so chaining can occur.  will not add the node if it's already
in the graph.
###
Graph.prototype.add_node = (node) ->
    return this unless node instanceof GraphNode
    @nodes = [] unless @nodes instanceof Array
    for next in @nodes
        return this if next.equals node

    @nodes.push node
    return this

###
add_edge

add the given edge to the graph, only if it's a GraphEdge, and
return this so chaining can occur.  will not add the given edge
if it's already in the graph.
###
Graph.prototype.add_edge = (edge) ->
    return this unless edge instanceof GraphEdge
    @edges = [] unless @edges instanceof Array
    for next in @edges
        return this if next.equals(edge)

    this.add_node(edge.node_one)
        .add_node(edge.node_two)
    @edges.push(edge)
    return this

###
get_neighbors

helper that returns a list of all neighbors for the given
node in this graph, or an empty list if none exist or if
the given node is not a GraphNode.  passes each
successive resulting neighbor to the given callback if
provided.
###
Graph.prototype.get_neighbors = (node, cb) ->
    return [] unless node instanceof GraphNode
    @nodes = [] unless @nodes instanceof Array

    neighbors = (next for next in @nodes when next.is_neighbor_to(node))
    if typeof cb is 'function'
        for neighbor in neighbors
            cb.call(this, neighbor)
            
    neighbors

###
equals

In order for two graphs to be considered equal,
their node and edge lists must contain the same set of nodes/edges.
You have no choice but to iterate on both lists and ensure that
neither is a sub/super-set of the other.
###
Graph.prototype.equals = (other) ->
    return false unless other instanceof Graph

    # first, ensure both objects have lists - if either is missing
    # a list of nodes or edges, equality is already moot.
    return false if not (@nodes instanceof Array) and other.nodes instanceof Array
    return false if @nodes instanceof Array and not (other.nodes instanceof Array)
    return false if not (@edges instanceof Array) and other.edges instanceof Array
    return false if @edges instanceof Array and not (other.edges instanceof Array)

    for next_node in @nodes
        found = false
        for other_node in other.nodes
            if next_node.equals other_node
                found = true
                break

        return false if not found

    for next_edge in @edges
        found = false
        for other_edge in other.edges
            if next_edge.equals other_edge
                found = true
                break

        return false if not found

    for other_node in other.nodes
        found = false;
        for this_node in @nodes
            if other_node.equals this_node
                found = true
                break;

        return false if not found

    for other_edge in other.edges
        found = false;
        for this_edge in @edges
            if other_edge.equals this_edge
                found = true
                break

        return false if not found

    return true;

module.exports = Graph;
