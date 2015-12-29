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

    # #equals

    describe "#is_left_neighbor_of", ->
        it "returns true when caller is to the left of neighbor", ->
            caller = new GraphNode
                x:1,
                y:5
            neighbor = new GraphNode
                x:2,
                y:5

            assert(caller.is_left_neighbor_of(neighbor))

        it "returns false when caller is not to the left of neighbor", ->
            caller = new GraphNode
                x:2,
                y:5
            neighbor = new GraphNode
                x:2,
                y:5

            assert.isFalse(caller.is_left_neighbor_of(neighbor))
            caller.x = neighbor.x+1
            assert.isFalse(caller.is_left_neighbor_of(neighbor))

        it "returns false for anything not a GraphNode", ->
            caller = new GraphNode
                x:2,
                y:5
            assert.isFalse(caller.is_left_neighbor_of {})
            assert.isFalse(caller.is_left_neighbor_of 'hi')
            assert.isFalse(caller.is_left_neighbor_of 1)
            assert.isFalse(caller.is_left_neighbor_of null)

    # #is_left_neighbor_of

    describe "#is_right_neighbor_of", ->
        it "returns true when caller is to the right of neighbor", ->
            caller = new GraphNode
                x:1,
                y:5
            neighbor = new GraphNode
                x:0,
                y:5

            assert(caller.is_right_neighbor_of(neighbor))

        it "returns false when caller is not to the right of neighbor", ->
            caller = new GraphNode
                x:2,
                y:5
            neighbor = new GraphNode
                x:2,
                y:5

            assert.isFalse(caller.is_right_neighbor_of(neighbor))
            caller.x = neighbor.x-1
            assert.isFalse(caller.is_right_neighbor_of(neighbor))

        it "returns false for anything not a GraphNode", ->
            caller = new GraphNode
                x:2,
                y:5
            assert.isFalse(caller.is_right_neighbor_of {})
            assert.isFalse(caller.is_right_neighbor_of 'hi')
            assert.isFalse(caller.is_right_neighbor_of 1)
            assert.isFalse(caller.is_right_neighbor_of null)

    # #is_right_neighbor_of

    describe "#is_top_neighbor_of", ->
        it "returns true when caller is to the top of neighbor", ->
            caller = new GraphNode
                x:1,
                y:4
            neighbor = new GraphNode
                x:1,
                y:5

            assert(caller.is_top_neighbor_of(neighbor))

        it "returns false when caller is not to the top of neighbor", ->
            caller = new GraphNode
                x:2,
                y:5
            neighbor = new GraphNode
                x:2,
                y:5

            assert.isFalse(caller.is_top_neighbor_of(neighbor))
            caller.x = neighbor.y+1
            assert.isFalse(caller.is_top_neighbor_of(neighbor))

        it "returns false for anything not a GraphNode", ->
            caller = new GraphNode
                x:2,
                y:5
            assert.isFalse(caller.is_top_neighbor_of {})
            assert.isFalse(caller.is_top_neighbor_of 'hi')
            assert.isFalse(caller.is_top_neighbor_of 1)
            assert.isFalse(caller.is_top_neighbor_of null)

    # #is_top_neighbor_of

    describe "#is_bottom_neighbor_of", ->
        it "returns true when caller is to the bottom of neighbor", ->
            caller = new GraphNode
                x:1,
                y:6
            neighbor = new GraphNode
                x:1,
                y:5

            assert(caller.is_bottom_neighbor_of(neighbor))

        it "returns false when caller is not to the bottom of neighbor", ->
            caller = new GraphNode
                x:2,
                y:5
            neighbor = new GraphNode
                x:2,
                y:5

            assert.isFalse(caller.is_bottom_neighbor_of(neighbor))
            caller.x = neighbor.y-1
            assert.isFalse(caller.is_bottom_neighbor_of(neighbor))

        it "returns false for anything not a GraphNode", ->
            caller = new GraphNode
                x:2,
                y:5
            assert.isFalse(caller.is_bottom_neighbor_of {})
            assert.isFalse(caller.is_bottom_neighbor_of 'hi')
            assert.isFalse(caller.is_bottom_neighbor_of 1)
            assert.isFalse(caller.is_bottom_neighbor_of null)

    # #is_bottom_neighbor_of

    describe "#is_neighbor_to", ->
        
        it "returns true for any GraphNode adjacent to it", ->
            caller = new GraphNode
            neighbor = new GraphNode
                x:3
                y:3

            # GraphNode to the top
            caller.x = neighbor.x
            caller.y = neighbor.y - 1
            assert caller.is_top_neighbor_of(neighbor)
            assert caller.is_neighbor_to(neighbor)

            # GraphNode to the bottom
            caller.x = neighbor.x
            caller.y = neighbor.y + 1
            assert caller.is_bottom_neighbor_of(neighbor)
            assert caller.is_neighbor_to(neighbor)

            # GraphNode to the left
            caller.x = neighbor.x - 1
            caller.y = neighbor.y
            assert caller.is_left_neighbor_of(neighbor)
            assert caller.is_neighbor_to(neighbor)

            # GraphNode to the right
            caller.x = neighbor.x + 1
            caller.y = neighbor.y
            assert caller.is_right_neighbor_of(neighbor)
            assert caller.is_neighbor_to(neighbor)

        it "returns true for coordinates adjacent to it", ->
            caller = new GraphNode
            neighbor = new GraphNode
                x:3
                y:3

            # coordinates to the top
            caller.x = neighbor.x
            caller.y = neighbor.y - 1
            assert caller.is_top_neighbor_of(neighbor)
            assert caller.is_neighbor_to(neighbor.x, neighbor.y)

            # coordinates to the bottom
            caller.x = neighbor.x
            caller.y = neighbor.y + 1
            assert caller.is_bottom_neighbor_of(neighbor)
            assert caller.is_neighbor_to(neighbor.x, neighbor.y)

            # coordinates to the left
            caller.x = neighbor.x - 1
            caller.y = neighbor.y
            assert caller.is_left_neighbor_of(neighbor)
            assert caller.is_neighbor_to(neighbor.x, neighbor.y)

            # coordinates to the right
            caller.x = neighbor.x + 1
            caller.y = neighbor.y
            assert caller.is_right_neighbor_of(neighbor)
            assert caller.is_neighbor_to(neighbor.x, neighbor.y)

        it "returns false for everything else", ->
            caller = new GraphNode
                x:2
                y:2

            functionThatThrows = ->
                caller.is_neighbor_to(1)

            assert.isFalse(caller.is_neighbor_to null)
            assert.isFalse(caller.is_neighbor_to undefined)
            assert.throw(functionThatThrows, Error)
            assert.isFalse(caller.is_neighbor_to 'hi')
            assert.isFalse(caller.is_neighbor_to {})

    # #is_neighbor_to
