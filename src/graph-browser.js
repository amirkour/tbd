// this script is used at buildtime by browserify to expose
// node modules to the browser.

var GraphNode = require('../lib/graph-node')
    // GraphEdge = require('./graph-edge'),
    // Graph = require('./graph');

(function(window){
    window.GraphNode = GraphNode;
    // window.GraphEdge = GraphEdge;
    // window.Graph = Graph;
})(window);
