var GraphNode = require('./graph-node'),
    GraphEdge = require('./graph-edge');

var Graph = function(options){
    this.nodes = options ? (options.nodes || []) : [];
    this.edges = options ? (options.edges || []) : [];
}

Graph.prototype.equals = function(other){
    if(!other instanceof Graph) return false;

    // TODO
}

module.exports = Graph;
