GraphNode = require '../lib/graph-node'
chai = require 'chai'
assert = chai.assert

describe 'GraphNode', ->
    describe 'sanity tests', ->
        it 'should be recognized', ->
            assert typeof GraphNode is 'function'

        it 'should instantiate', ->
            assert new GraphNode() instanceof GraphNode

    describe "#equals", ->
        beforeEach ->
            this.node = new GraphNode({
                x:5
                y:7
            })

        it "should return false for random object", ->
            assert(this.node.equals({foo:'bar'}) is false);

        it "should return false for null", ->
            assert(this.node.equals(null) is false)

        it "should return false for unequals GraphNode object", ->
            randX = this.node.x + 1
            randY = this.node.y + 1
            assert(this.node.equals(new GraphNode({x:randX,y:randY})) is false);

        it "should return true for equal GraphNode object", ->
            equalNode = new GraphNode({x: this.node.x, y: this.node.y})
            assert this.node.equals(equalNode)
