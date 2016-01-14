GraphUtils = require "../src/graph-utils"
chai = require "chai"
assert = chai.assert

describe "GraphUtils", ->

    describe "#quacks_like_a_graph_node", ->

        it "returns true if object has x and y with typeof number", ->
            a = {x:1,y:2}
            assert( GraphUtils.quacks_like_a_graph_node(a) )

            a = {x:1,y:2, a:{}, b:"doesn't matter"}
            assert( GraphUtils.quacks_like_a_graph_node(a) )

        it "returns false if object has x or y that isn't a number", ->
            a = {x:'hi',y:1}
            assert.isFalse( GraphUtils.quacks_like_a_graph_node(a) )

            a.x = 1
            a.y = "hi"
            assert.isFalse( GraphUtils.quacks_like_a_graph_node(a) )

            a.x = {}
            a.y  = 1
            assert.isFalse( GraphUtils.quacks_like_a_graph_node(a) )

        it "returns false if x or y are null or undefined", ->
            a = {}
            assert.isFalse( GraphUtils.quacks_like_a_graph_node(a) )

            a = {}
            a.x = null;
            assert.isFalse( GraphUtils.quacks_like_a_graph_node(a) )

            a = {}
            a.y = null;
            assert.isFalse( GraphUtils.quacks_like_a_graph_node(a) )

    # quacks_like_a_graph_node

    describe "#quacks_like_a_graph_edge", ->

        it "returns true if the edge has node_one and node_two that both quack like a graph node", ->
            node_one = {x:1,y:234}
            node_two = {x:24,y:3453543, a:'hi', b:{}}
            a = {
                node_one: node_one
                node_two: node_two
            }

            assert( GraphUtils.quacks_like_a_graph_edge(a))

        it "returns false if node_one or node_two are either null or undefined", ->
            one = null
            two = {x:1,y:2}
            edge = {node_one: one, node_two: two}
            assert.isFalse( GraphUtils.quacks_like_a_graph_edge(edge) )

            one = undefined
            two = {x:1,y:2}
            edge = {node_one: one, node_two: two}
            assert.isFalse( GraphUtils.quacks_like_a_graph_edge(edge) )

            one = {x:1,y:2}
            two = null
            edge = {node_one: one, node_two: two}
            assert.isFalse( GraphUtils.quacks_like_a_graph_edge(edge) )

            one = {x:1,y:2}
            two = undefined
            edge = {node_one: one, node_two: two}
            assert.isFalse( GraphUtils.quacks_like_a_graph_edge(edge) )

        it "returns false if either node_one or node_two doesn't quack like a graph node", ->
            one = {x:'hi',y:2}
            two = {x:234234,y:2124}
            edge = {node_one: one, node_two: two}
            assert.isFalse( GraphUtils.quacks_like_a_graph_edge(edge) )

            one = {x:123,y:2}
            two = {x:'hi',y:2124}
            edge = {node_one: one, node_two: two}
            assert.isFalse( GraphUtils.quacks_like_a_graph_edge(edge) )
    # quacks_like_a_graph_edge

    describe "#quacks_like_a_graph", ->

        it "returns true if the object has both 'nodes' and 'edges' properties, both of which are arrays", ->
            a = {
                nodes: []
                edges: []
            }
            assert( GraphUtils.quacks_like_a_graph(a) )

        it "returns false if the 'nodes' or 'edges' properties are null", ->
            a = {
                nodes: null
                edges: []
            }
            assert.isFalse( GraphUtils.quacks_like_a_graph(a) )

            a = {
                nodes: []
                edges: null
            }
            assert.isFalse( GraphUtils.quacks_like_a_graph(a) )

        it "returns false if the 'nodes' or 'edges' properties are undefined", ->
            a = {
                edges: []
            }
            assert.isFalse( GraphUtils.quacks_like_a_graph(a) )

            a = {
                nodes: []
            }
            assert.isFalse( GraphUtils.quacks_like_a_graph(a) )
            
    # quacks_like_a_graph