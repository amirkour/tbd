var GraphNode = require('../src/graph-node'),
    GraphEdge = require('../src/graph-edge'),
    Graph = require('../src/graph'),
    chai = require('chai'),
    assert = chai.assert;

describe("Graph",function(){
    describe("sanity test",function(){
        it("is a function",function(){
            assert(typeof Graph === 'function');
        });
    });

    describe("#equals",function(){
        describe("with node and edge lists that have the same nodes/edges",function(){
            it("returns true, regardless of ordering",function(){
                var e1_n1 = new GraphNode({x:1,y:1}),
                    e1_n2 = new GraphNode({x:2,y:2}),
                    e1 = new GraphEdge({node_one:e1_n1, node_two:e1_n2}),
                    e2_n1 = new GraphNode({x:3,y:3}),
                    e2_n2 = new GraphNode({x:4,y:4}),
                    e2 = new GraphEdge({node_one:e2_n1, node_two: e2_n2}),
                    g1_nodes = [],
                    g2_nodes = [],
                    g1_edges = [],
                    g2_edges = [];

                    g1_nodes.push(e1_n1);
                    g1_nodes.push(e1_n2);
                    g1_nodes.push(e2_n1);
                    g1_nodes.push(e2_n2);
                    g1_edges.push(e1);
                    g1_edges.push(e2);

                    // push graph-2's edges and nodes out of order on purpose
                    // to verify equality won't care about ordering
                    g2_nodes.push(e1_n2);
                    g2_nodes.push(e2_n1);
                    g2_nodes.push(e1_n1);
                    g2_nodes.push(e2_n2);
                    g2_edges.push(e2);
                    g2_edges.push(e1);

                    var graph_one = new Graph({
                            nodes: g1_nodes,
                            edges: g1_edges
                        }),
                        graph_two = new Graph({
                            nodes: g2_nodes,
                            edges: g2_edges
                        });

                    assert(graph_one.equals(graph_two));
                    assert(graph_two.equals(graph_one));
            });
        });
        describe("when one node/edge list is a subset of another",function(){
            it("return false",function(){
                var e1_n1 = new GraphNode({x:1,y:1}),
                    e1_n2 = new GraphNode({x:2,y:2}),
                    e1 = new GraphEdge({node_one:e1_n1, node_two:e1_n2}),
                    e2_n1 = new GraphNode({x:3,y:3}),
                    e2_n2 = new GraphNode({x:4,y:4}),
                    e2 = new GraphEdge({node_one:e2_n1, node_two: e2_n2}),
                    g1_nodes = [],
                    g2_nodes = [],
                    g1_edges = [],
                    g2_edges = [];

                    g1_nodes.push(e1_n1);
                    g1_nodes.push(e1_n2);
                    g1_nodes.push(e2_n1);
                    g1_nodes.push(e2_n2);
                    g1_edges.push(e1);
                    g1_edges.push(e2);

                    g2_nodes.push(e1_n2);
                    g2_nodes.push(e1_n1);
                    g2_edges.push(e1);

                    var graph_one = new Graph({
                            nodes: g1_nodes,
                            edges: g1_edges
                        }),
                        graph_two = new Graph({
                            nodes: g2_nodes,
                            edges: g2_edges
                        });

                    assert(!graph_one.equals(graph_two));
                    assert(!graph_two.equals(graph_one));
            });
        });
        describe("when a node/edge list is null/missing",function(){
            it("returns false",function(){
                var e1_n1 = new GraphNode({x:1,y:1}),
                    e1_n2 = new GraphNode({x:2,y:2}),
                    e1 = new GraphEdge({node_one:e1_n1, node_two:e1_n2}),
                    e2_n1 = new GraphNode({x:3,y:3}),
                    e2_n2 = new GraphNode({x:4,y:4}),
                    e2 = new GraphEdge({node_one:e2_n1, node_two: e2_n2}),
                    g1_nodes = [],
                    g2_nodes = null,
                    g1_edges = [],
                    g2_edges = [];

                    g1_nodes.push(e1_n1);
                    g1_nodes.push(e1_n2);
                    g1_nodes.push(e2_n1);
                    g1_nodes.push(e2_n2);
                    g1_edges.push(e1);
                    g1_edges.push(e2);

                    g2_edges.push(e1);
                    g2_edges.push(e2);

                    var graph_one = new Graph({
                            nodes: g1_nodes,
                            edges: g1_edges
                        }),
                        graph_two = new Graph({
                            nodes: g2_nodes,
                            edges: g2_edges
                        });

                    assert(!graph_one.equals(graph_two));
                    assert(!graph_two.equals(graph_one));

                    // now test when edges are null, but nodes are sound
                    graph_two.nodes = [];
                    graph_two.nodes.push(e1_n1);
                    graph_two.nodes.push(e1_n2);
                    graph_two.nodes.push(e2_n1);
                    graph_two.nodes.push(e2_n2);
                    graph_two.edges = null;
                    assert(!graph_one.equals(graph_two));
                    assert(!graph_two.equals(graph_one));
            });
        });
        describe("when a node/edge list has unequal nodes/edges",function(){
            it("returns false",function(){
                var e1_n1 = new GraphNode({x:1,y:1}),
                    e1_n2 = new GraphNode({x:2,y:2}),
                    e1 = new GraphEdge({node_one:e1_n1, node_two:e1_n2}),
                    e2_n1 = new GraphNode({x:3,y:3}),
                    e2_n2 = new GraphNode({x:4,y:4}),
                    e2 = new GraphEdge({node_one:e2_n1, node_two: e2_n2}),
                    g1_nodes = [],
                    g2_nodes = [],
                    g1_edges = [],
                    g2_edges = [];

                    g1_nodes.push(e1_n1);
                    g1_nodes.push(e1_n2);
                    g1_edges.push(e1);

                    g2_nodes.push(e2_n1);
                    g2_nodes.push(e2_n2);
                    g2_edges.push(e2);

                    var graph_one = new Graph({
                            nodes: g1_nodes,
                            edges: g1_edges
                        }),
                        graph_two = new Graph({
                            nodes: g2_nodes,
                            edges: g2_edges
                        });

                    assert(!graph_one.equals(graph_two));
                    assert(!graph_two.equals(graph_one));
            });
        });
        it("returns false if 'other' is not a graph",function(){
            var graph = new Graph();
            assert(!graph.equals(null));
            assert(!graph.equals({}));
        });
        it("returns true of the node and edge lists are non-null and empty",function(){
            var graph1 = new Graph({nodes:[],edges:[]}),
                graph2 = new Graph({nodes:[],edges:[]});
            assert(graph1.equals(graph2));
            assert(graph2.equals(graph1));
        });
    });
    // #equals
});
