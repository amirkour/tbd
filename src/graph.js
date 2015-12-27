var GraphNode = require('./graph-node'),
    GraphEdge = require('./graph-edge');

var Graph = function(options){
    options = options || {};
    this.nodes = (options.nodes || []);
    this.edges = (options.edges || []);
};

/*
 * equals
 *
 * In order for two graphs to be considered equal,
 * their node and edge lists must contain the same set of nodes/edges.
 * You have no choice but to iterate on both lists and ensure that
 * neither is a sub/super-set of the other.
 */
Graph.prototype.equals = function(other){
    if(!(other instanceof Graph)) return false;

    // first, ensure both objects have lists - if either is missing
    // a list of nodes or edges, equality is already moot.
    if(!(this.nodes instanceof Array) && other.nodes instanceof Array) return false;
    if(this.nodes instanceof Array && !(other.nodes instanceof Array)) return false;
    if(!(this.edges instanceof Array) && other.edges instanceof Array) return false;
    if(this.edges instanceof Array && !(other.edges instanceof Array)) return false;

    var i = 0, j = 0,
        ilen = 0, jlen = 0,
        found = false;

    for(i = 0, ilen = this.nodes.length; i < ilen; i++){
        found = false;
        for(j = 0, jlen = other.nodes.length; j < jlen; j++){
            if(this.nodes[i].equals(other.nodes[j])){
                found = true;
                break;
            }
        }

        if(!found) return false;
    }

    for(i = 0, ilen = this.edges.length; i < ilen; i++){
        found = false;
        for(j = 0, jlen = other.edges.length; j < jlen; j++){
            if(this.edges[i].equals(other.edges[j])){
                found = true;
                break;
            }
        }

        if(!found) return false;
    }

    for(i = 0, ilen = other.nodes.length; i < ilen; i++){
        found = false;
        for(j = 0, jlen = this.nodes.length; j < jlen; j++){
            if(other.nodes[i].equals(this.nodes[j])){
                found = true;
                break;
            }
        }

        if(!found) return false;
    }

    for(i = 0, ilen = other.edges.length; i < ilen; i++){
        found = false;
        for(j = 0, jlen = this.edges.length; j < jlen; j++){
            if(other.edges[i].equals(this.edges[j])){
                found = true;
                break;
            }
        }

        if(!found) return false;
    }

    return true;
};

module.exports = Graph;
