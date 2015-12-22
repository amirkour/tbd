var GraphNode = require('../src/graph-node'),
    chai = require('chai'),
    assert = chai.assert;

describe('GraphNode', function(){
    describe('sanity tests', function(){
        it('should be recognized', function(){
            assert(typeof GraphNode === 'function');
        });

        it('should instantiate', function(){
            assert(new GraphNode() instanceof GraphNode);
        });
    });

    describe("#equals", function(){
        beforeEach(function(){
            this.node = new GraphNode({x:5,y:7});
        });
        it("should return false for random object", function(){
            assert(this.node.equals({foo:'bar'}) === false);
        });
        it("should return false for null", function(){
            assert(this.node.equals(null) === false);
        });
        it("should return false for unequals GraphNode object", function(){
            var randX = this.node.x + 1,
                randY = this.node.y + 1;
            assert(this.node.equals(new GraphNode({x:randX,y:randY})) === false);
        });
        it("should return true for equal GraphNode object", function(){
            var equalNode = new GraphNode({x: this.node.x, y: this.node.y});
            assert(this.node.equals(equalNode) === true);
        });
    });
});
