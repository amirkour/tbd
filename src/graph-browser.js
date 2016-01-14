// this script is used at buildtime by browserify to expose
// node modules to the browser.

var GraphUtils = require('../lib/graph-utils'),
    GraphNode = require('../lib/graph-node')
    GraphEdge = require('../lib/graph-edge'),
    Graph = require('../lib/graph');

(function(window){
    window.GraphUtils = GraphUtils;
    window.GraphNode = GraphNode;
    window.GraphEdge = GraphEdge;
    window.Graph = Graph;
})(window);
