GraphNode = require './graph-node'
GraphEdge = require './graph-edge'

###
Graph

Defines a basic, non-directed graph
###
Graph = (options) ->
    options = options or {};
    this.nodes = (options.nodes or [])
    this.edges = (options.edges or [])

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
    return false if not (this.nodes instanceof Array) and other.nodes instanceof Array
    return false if this.nodes instanceof Array and not (other.nodes instanceof Array)
    return false if not (this.edges instanceof Array) and other.edges instanceof Array
    return false if this.edges instanceof Array and not (other.edges instanceof Array)

    for next_node in this.nodes
        found = false
        for other_node in other.nodes
            if next_node.equals other_node
                found = true
                break

        return false if not found

    for next_edge in this.edges
        found = false
        for other_edge in other.edges
            if next_edge.equals other_edge
                found = true
                break

        return false if not found

    for other_node in other.nodes
        found = false;
        for this_node in this.nodes
            if other_node.equals this_node
                found = true
                break;

        return false if not found

    for other_edge in other.edges
        found = false;
        for this_edge in this.edges
            if other_edge.equals this_edge
                found = true
                break

        return false if not found

    return true;

module.exports = Graph;
