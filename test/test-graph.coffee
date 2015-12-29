GraphNode = require '../src/graph-node'
GraphEdge = require '../src/graph-edge'
Graph = require '../src/graph'
chai = require 'chai'
assert = chai.assert

describe "Graph", ->
    describe "sanity test", ->
        it "is a function", ->
            assert typeof Graph is 'function'

    describe "#equals", ->
        describe "with node and edge lists that have the same nodes/edges", ->
            it "returns true, regardless of ordering", ->
                e1_n1 = new GraphNode({x:1,y:1})
                e1_n2 = new GraphNode({x:2,y:2})
                e1 = new GraphEdge({node_one:e1_n1, node_two:e1_n2})
                e2_n1 = new GraphNode({x:3,y:3})
                e2_n2 = new GraphNode({x:4,y:4})
                e2 = new GraphEdge({node_one:e2_n1, node_two: e2_n2})
                g1_nodes = []
                g2_nodes = []
                g1_edges = []
                g2_edges = []

                g1_nodes.push(e1_n1)
                g1_nodes.push(e1_n2)
                g1_nodes.push(e2_n1)
                g1_nodes.push(e2_n2)
                g1_edges.push(e1)
                g1_edges.push(e2)

                # push graph-2's edges and nodes out of order on purpose
                # to verify equality won't care about ordering
                g2_nodes.push(e1_n2)
                g2_nodes.push(e2_n1)
                g2_nodes.push(e1_n1)
                g2_nodes.push(e2_n2)
                g2_edges.push(e2)
                g2_edges.push(e1)

                graph_one = new Graph
                    nodes: g1_nodes
                    edges: g1_edges

                graph_two = new Graph
                    nodes: g2_nodes
                    edges: g2_edges

                assert(graph_one.equals(graph_two));
                assert(graph_two.equals(graph_one));

        describe "when one node/edge list is a subset of another", ->
            it "return false", ->
                e1_n1 = new GraphNode({x:1,y:1})
                e1_n2 = new GraphNode({x:2,y:2})
                e1 = new GraphEdge({node_one:e1_n1, node_two:e1_n2})
                e2_n1 = new GraphNode({x:3,y:3})
                e2_n2 = new GraphNode({x:4,y:4})
                e2 = new GraphEdge({node_one:e2_n1, node_two: e2_n2})
                g1_nodes = []
                g2_nodes = []
                g1_edges = []
                g2_edges = []

                g1_nodes.push(e1_n1)
                g1_nodes.push(e1_n2)
                g1_nodes.push(e2_n1)
                g1_nodes.push(e2_n2)
                g1_edges.push(e1)
                g1_edges.push(e2)

                g2_nodes.push(e1_n2)
                g2_nodes.push(e1_n1)
                g2_edges.push(e1)

                graph_one = new Graph
                    nodes: g1_nodes
                    edges: g1_edges

                graph_two = new Graph
                    nodes: g2_nodes
                    edges: g2_edges

                assert(not graph_one.equals(graph_two))
                assert(not graph_two.equals(graph_one))

        describe "when a node/edge list is null/missing", ->
            it "returns false", ->
                e1_n1 = new GraphNode({x:1,y:1})
                e1_n2 = new GraphNode({x:2,y:2})
                e1 = new GraphEdge({node_one:e1_n1, node_two:e1_n2})
                e2_n1 = new GraphNode({x:3,y:3})
                e2_n2 = new GraphNode({x:4,y:4})
                e2 = new GraphEdge({node_one:e2_n1, node_two: e2_n2})
                g1_nodes = []
                g2_nodes = null
                g1_edges = []
                g2_edges = []

                g1_nodes.push(e1_n1)
                g1_nodes.push(e1_n2)
                g1_nodes.push(e2_n1)
                g1_nodes.push(e2_n2)
                g1_edges.push(e1)
                g1_edges.push(e2)

                g2_edges.push(e1)
                g2_edges.push(e2)

                graph_one = new Graph
                    nodes: g1_nodes
                    edges: g1_edges

                graph_two = new Graph
                    nodes: g2_nodes
                    edges: g2_edges

                assert(not graph_one.equals(graph_two))
                assert(not graph_two.equals(graph_one))

                # now test when edges are null, but nodes are sound
                graph_two.nodes = []
                graph_two.nodes.push(e1_n1)
                graph_two.nodes.push(e1_n2)
                graph_two.nodes.push(e2_n1)
                graph_two.nodes.push(e2_n2)
                graph_two.edges = null
                assert(not graph_one.equals(graph_two))
                assert(not graph_two.equals(graph_one))

        describe "when a node/edge list has unequal nodes/edges", ->
            it "returns false", ->
                e1_n1 = new GraphNode({x:1,y:1})
                e1_n2 = new GraphNode({x:2,y:2})
                e1 = new GraphEdge({node_one:e1_n1, node_two:e1_n2})
                e2_n1 = new GraphNode({x:3,y:3})
                e2_n2 = new GraphNode({x:4,y:4})
                e2 = new GraphEdge({node_one:e2_n1, node_two: e2_n2})
                g1_nodes = []
                g2_nodes = []
                g1_edges = []
                g2_edges = []

                g1_nodes.push(e1_n1)
                g1_nodes.push(e1_n2)
                g1_edges.push(e1)

                g2_nodes.push(e2_n1)
                g2_nodes.push(e2_n2)
                g2_edges.push(e2)

                graph_one = new Graph
                    nodes: g1_nodes
                    edges: g1_edges

                graph_two = new Graph
                    nodes: g2_nodes
                    edges: g2_edges

                assert(not graph_one.equals(graph_two))
                assert(not graph_two.equals(graph_one))

        it "returns false if 'other' is not a graph", ->
            graph = new Graph()
            assert(not graph.equals(null))
            assert(not graph.equals({}))

        it "returns true of the node and edge lists are non-null and empty", ->
            graph1 = new Graph({nodes:[],edges:[]})
            graph2 = new Graph({nodes:[],edges:[]})
            assert(graph1.equals(graph2))
            assert(graph2.equals(graph1))
    # #equals

    describe "#add_node", ->
        it "adds the given node", ->
            node1 = new GraphNode
                x:1
                y:2

            graph = new Graph
                nodes: []

            assert.lengthOf graph.nodes, 0
            graph.add_node node1
            assert.lengthOf graph.nodes, 1
            assert(graph.nodes[0].equals(node1))

        it "doesn't add the same node twice", ->

            node1 = new GraphNode
                x:1
                y:2
            node2 = new GraphNode({x:123,y:23234})

            graph = new Graph
                nodes: [node1, node2]

            assert.lengthOf graph.nodes, 2
            graph.add_node node1
            assert.lengthOf graph.nodes, 2
            graph.add_node node2
            assert.lengthOf graph.nodes, 2

        it "only adds GraphNodes", ->
            graph = new Graph

            graph.add_node(1)
            assert.lengthOf graph.nodes, 0

            graph.add_node({})
            assert.lengthOf graph.nodes, 0

            graph.add_node("hi there")
            assert.lengthOf graph.nodes, 0

            graph.add_node(new GraphNode)
            assert.lengthOf graph.nodes, 1

        it "returns the graph, so chaining can occur", ->
            graph = new Graph
            assert graph.add_node() instanceof Graph
            assert graph.add_node() is graph
            assert graph.add_node(new GraphNode) is graph

    # #add_node

    describe "#add_edge", ->
        it "adds the given edge", ->
            edge = new GraphEdge
                node_one: new GraphNode({x:1,y:2})
                node_two: new GraphNode({x:3,y:5})
            graph = new Graph

            assert.lengthOf graph.edges, 0
            assert.lengthOf graph.add_edge(edge).edges, 1
            assert graph.edges[0] is edge

        it "doesn't add the same edge twice", ->
            edge = new GraphEdge
                node_one: new GraphNode({x:1,y:2})
                node_two: new GraphNode({x:3,y:5})
            graph = new Graph({edges: [edge] })

            graph.add_edge edge
            assert.lengthOf graph.edges, 1

        it "also adds the given nodes", ->
            node1 = new GraphNode({x:123,y:234})
            node2 = new GraphNode({x:3453,y:998})
            edge = new GraphEdge
                node_one:node1
                node_two:node2

            graph = new Graph
            assert.lengthOf graph.nodes, 0

            graph.add_edge edge
            assert.lengthOf graph.nodes, 2

            assert graph.nodes[0] is node1 or graph.nodes[1] is node1
            assert graph.nodes[0] is node2 or graph.nodes[1] is node2

        it "returns the graph", ->
            graph = new Graph
            assert graph.add_edge(graph) is graph
            assert graph.add_edge() is graph

    # #add_edge
