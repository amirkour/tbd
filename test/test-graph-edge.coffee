GraphNode = require '../lib/graph-node'
GraphEdge = require '../lib/graph-edge'
chai = require('chai')
assert = chai.assert

describe 'GraphEdge', ->
    describe 'sanity tests', ->
        it 'exists as a function', ->
            assert typeof GraphEdge is 'function'

    describe "#equals", ->
        before( ->
            this.node_one = new GraphNode({x:1,y:2})
            this.node_two = new GraphNode({x:2,y:3})
        )

        describe "when both edges have the same nodes", ->
            it "returns true, regardless of order", ->
                edge_one = new GraphEdge({node_one: this.node_one, node_two: this.node_two})
                edge_two = new GraphEdge({node_one: this.node_two, node_two: this.node_one})
                assert edge_one.equals(edge_two)
                assert edge_two.equals(edge_one)

        describe "when one edge has a null endpoint", ->
            it "returns false, regardless of order", ->
                edge_one = new GraphEdge({node_one: this.node_one, node_two: this.node_two})
                edge_two = new GraphEdge({node_one:null,node_two:this.node_one})
                debugger
                assert not edge_one.equals(edge_two)
                assert not edge_two.equals(edge_one)

        describe "when one edge has a non-node endpoint", ->
            it "returns false, regardless of order", ->
                edge_one = new GraphEdge({node_one: this.node_one, node_two: this.node_two})
                edge_two = new GraphEdge({node_one:{},node_two:this.node_one})

                assert not edge_one.equals(edge_two)
                assert not edge_two.equals(edge_one)

                edge_two.node_one = this.node_two
                edge_two.node_two = null
                assert not edge_one.equals(edge_two)
                assert not edge_two.equals(edge_one)
