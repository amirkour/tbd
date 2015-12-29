// this script is used at buildtime by browserify to expose
// node modules to the browser.

var GraphNode = require('../lib/graph-node')
    GraphEdge = require('../lib/graph-edge'),
    Graph = require('../lib/graph');

(function(window){
    window.GraphNode = GraphNode;
    window.GraphEdge = GraphEdge;
    window.Graph = Graph;
})(window);
