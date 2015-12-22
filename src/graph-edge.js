var GraphNode = require('./graph-node');

var GraphEdge = function(options){
    this.node_one = options ? options.node_one : null;
    this.node_two = options ? options.node_two : null;
};

GraphEdge.prototype.equals = function(other){
    if(!(other instanceof GraphEdge)) return false;

    return this.node_one && this.node_one.equals(other.node_one) &&
           this.node_two && this.node_two.equals(other.node_two);
};

module.exports = GraphEdge;
