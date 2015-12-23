/*
 * GraphEdge
 *
 * Represents an undirected edge in a graph.  Note that an undirected
 * edge makes no sense w/o exactly 2 graph nodes to define it.
 */
var GraphNode = require('./graph-node');

var GraphEdge = function(options){
    this.node_one = options ? options.node_one : null;
    this.node_two = options ? options.node_two : null;
};

/*
 * Test edge equality - note that an undirected edge is equal to another
 * undirected edge iff the nodes of both edges are equal, regardless
 * of their order.  If either edge does not have two nodes, equality
 * makes no sense - an undirected edge can't exist w/o 2 nodes!
 */
GraphEdge.prototype.equals = function(other){
    if(!(other instanceof GraphEdge)) return false;
    if(!(other.node_one instanceof GraphNode) || !(other.node_two instanceof GraphNode)) return false;
    if(!(this.node_one instanceof GraphNode) || !(this.node_two instanceof GraphNode)) return false;

    return (this.node_one.equals(other.node_one) && this.node_two.equals(other.node_two)) ||
           (this.node_two.equals(other.node_one) && this.node_one.equals(other.node_two));
};

module.exports = GraphEdge;
