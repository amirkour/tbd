var GraphNode = require('../src/graph-node'),
    GraphEdge = require('../src/graph-edge'),
    chai = require('chai'),
    assert = chai.assert;

describe('GraphEdge', function(){
    describe('sanity tests', function(){
        it('exists as a function', function(){
            assert(typeof GraphEdge === 'function');
        });
    });

    describe("#equals",function(){
        before(function(){
            this.node_one = new GraphNode({x:1,y:2});
            this.node_two = new GraphNode({x:2,y:3});
        });
        describe("when both edges have the same nodes", function(){
            it("returns true, regardless of order", function(){
                var edge_one = new GraphEdge({node_one: this.node_one, node_two: this.node_two}),
                    edge_two = new GraphEdge({node_one: this.node_two, node_two: this.node_one});

                assert(edge_one.equals(edge_two));
                assert(edge_two.equals(edge_one));
            });
        });
        describe("when one edge has a null endpoint",function(){
            it("returns false, regardless of order",function(){
                var edge_one = new GraphEdge({node_one: this.node_one, node_two: this.node_two}),
                    edge_two = new GraphEdge({node_one:null,node_two:this.node_one});

                assert(!edge_one.equals(edge_two));
                assert(!edge_two.equals(edge_one));
            });
        });
        describe("when one edge has a non-node endpoint",function(){
            it("returns false, regardless of order",function(){
                var edge_one = new GraphEdge({node_one: this.node_one, node_two: this.node_two}),
                    edge_two = new GraphEdge({node_one:{},node_two:this.node_one});

                assert(!edge_one.equals(edge_two));
                assert(!edge_two.equals(edge_one));

                edge_two.node_one = this.node_two;
                edge_two.node_two = null;
                assert(!edge_one.equals(edge_two));
                assert(!edge_two.equals(edge_one));
            });
        });
    });
});
