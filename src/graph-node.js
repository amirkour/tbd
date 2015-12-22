
var GraphNode = function(options){
    this.x = options ? (options.x || 0) : 0;
    this.y = options ? (options.y || 0) : 0;
}

GraphNode.prototype.equals = function(other){
    if(!other instanceof GraphNode) return false;

    return other.x === this.x && other.y === this.y;
}

module.exports = GraphNode;
