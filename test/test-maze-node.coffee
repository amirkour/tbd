GraphUtils = require '../lib/graph-utils'
MazeNode = require '../lib/maze-node'
chai = require 'chai'
assert = chai.assert

describe "MazeNode", ->
    describe "identity", ->
        it "quacks like a GraphNode!", ->
            a = new MazeNode({x:1,y:2,b:'doesnt matter'})
            assert( GraphUtils.quacks_like_a_graph_node(a) )

            a = new MazeNode()
            assert( GraphUtils.quacks_like_a_graph_node(a) )

    describe "#equals", ->
        it "returns true for two equal maze nodes", ->
            a = new MazeNode({
                    x:1
                    y:2
                    is_wall:true
                })
            b = new MazeNode({
                    x:1
                    y:2
                    is_wall:true
                })
            assert( a.equals(b) )
            assert( b.equals(a) )

        it "returns false for two unequal maze nodes", ->
            a = new MazeNode
            b = new MazeNode({y:123})
            assert.isFalse( a.equals(b) )
            assert.isFalse( b.equals(a) )

    # #equals