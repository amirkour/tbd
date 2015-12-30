(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
// this script is used at buildtime by browserify to expose
// node modules to the browser.

var GraphNode = require('./graph-node'),
    GraphEdge = require('./graph-edge'),
    Graph = require('./graph');

(function(window){
    window.GraphNode = GraphNode;
    window.GraphEdge = GraphEdge;
    window.Graph = Graph;
})(window);

},{"./graph":4,"./graph-edge":2,"./graph-node":3}],2:[function(require,module,exports){
var GraphNode = require('./graph-node');

var GraphEdge = function(options){
    this.node_one = options ? options.node_one : null;
    this.node_two = options ? options.node_two : null;
}

GraphEdge.prototype.equals = function(other){
    if(!other instanceof GraphEdge) return false;

    return this.node_one && this.node_one.equals(other.node_one) &&
           this.node_two && this.node_two.equals(other.node_two);
}

module.exports = GraphEdge;

},{"./graph-node":3}],3:[function(require,module,exports){

var GraphNode = function(options){
    this.x = options ? (options.x || 0) : 0;
    this.y = options ? (options.y || 0) : 0;
}

GraphNode.prototype.equals = function(other){
    if(!other instanceof GraphNode) return false;

    return other.x === this.x && other.y === this.y;
}

module.exports = GraphNode;

},{}],4:[function(require,module,exports){
var GraphNode = require('./graph-node'),
    GraphEdge = require('./graph-edge');

var Graph = function(options){
    this.nodes = options ? (options.nodes || []) : [];
    this.edges = options ? (options.edges || []) : [];
}

Graph.prototype.equals = function(other){
    if(!other instanceof Graph) return false;

    // TODO
}

module.exports = Graph;

},{"./graph-edge":2,"./graph-node":3}]},{},[1])
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi4uLy4uLy4uLy4uL3Vzci9sb2NhbC9saWIvbm9kZV9tb2R1bGVzL2Jyb3dzZXJpZnkvbm9kZV9tb2R1bGVzL2Jyb3dzZXItcGFjay9fcHJlbHVkZS5qcyIsInNyYy9ncmFwaC1icm93c2VyLmpzIiwic3JjL2dyYXBoLWVkZ2UuanMiLCJzcmMvZ3JhcGgtbm9kZS5qcyIsInNyYy9ncmFwaC5qcyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiQUFBQTtBQ0FBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBOztBQ1pBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBOztBQ2ZBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7O0FDYkE7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0EiLCJmaWxlIjoiZ2VuZXJhdGVkLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXNDb250ZW50IjpbIihmdW5jdGlvbiBlKHQsbixyKXtmdW5jdGlvbiBzKG8sdSl7aWYoIW5bb10pe2lmKCF0W29dKXt2YXIgYT10eXBlb2YgcmVxdWlyZT09XCJmdW5jdGlvblwiJiZyZXF1aXJlO2lmKCF1JiZhKXJldHVybiBhKG8sITApO2lmKGkpcmV0dXJuIGkobywhMCk7dmFyIGY9bmV3IEVycm9yKFwiQ2Fubm90IGZpbmQgbW9kdWxlICdcIitvK1wiJ1wiKTt0aHJvdyBmLmNvZGU9XCJNT0RVTEVfTk9UX0ZPVU5EXCIsZn12YXIgbD1uW29dPXtleHBvcnRzOnt9fTt0W29dWzBdLmNhbGwobC5leHBvcnRzLGZ1bmN0aW9uKGUpe3ZhciBuPXRbb11bMV1bZV07cmV0dXJuIHMobj9uOmUpfSxsLGwuZXhwb3J0cyxlLHQsbixyKX1yZXR1cm4gbltvXS5leHBvcnRzfXZhciBpPXR5cGVvZiByZXF1aXJlPT1cImZ1bmN0aW9uXCImJnJlcXVpcmU7Zm9yKHZhciBvPTA7bzxyLmxlbmd0aDtvKyspcyhyW29dKTtyZXR1cm4gc30pIiwiLy8gdGhpcyBzY3JpcHQgaXMgdXNlZCBhdCBidWlsZHRpbWUgYnkgYnJvd3NlcmlmeSB0byBleHBvc2Vcbi8vIG5vZGUgbW9kdWxlcyB0byB0aGUgYnJvd3Nlci5cblxudmFyIEdyYXBoTm9kZSA9IHJlcXVpcmUoJy4vZ3JhcGgtbm9kZScpLFxuICAgIEdyYXBoRWRnZSA9IHJlcXVpcmUoJy4vZ3JhcGgtZWRnZScpLFxuICAgIEdyYXBoID0gcmVxdWlyZSgnLi9ncmFwaCcpO1xuXG4oZnVuY3Rpb24od2luZG93KXtcbiAgICB3aW5kb3cuR3JhcGhOb2RlID0gR3JhcGhOb2RlO1xuICAgIHdpbmRvdy5HcmFwaEVkZ2UgPSBHcmFwaEVkZ2U7XG4gICAgd2luZG93LkdyYXBoID0gR3JhcGg7XG59KSh3aW5kb3cpO1xuIiwidmFyIEdyYXBoTm9kZSA9IHJlcXVpcmUoJy4vZ3JhcGgtbm9kZScpO1xuXG52YXIgR3JhcGhFZGdlID0gZnVuY3Rpb24ob3B0aW9ucyl7XG4gICAgdGhpcy5ub2RlX29uZSA9IG9wdGlvbnMgPyBvcHRpb25zLm5vZGVfb25lIDogbnVsbDtcbiAgICB0aGlzLm5vZGVfdHdvID0gb3B0aW9ucyA/IG9wdGlvbnMubm9kZV90d28gOiBudWxsO1xufVxuXG5HcmFwaEVkZ2UucHJvdG90eXBlLmVxdWFscyA9IGZ1bmN0aW9uKG90aGVyKXtcbiAgICBpZighb3RoZXIgaW5zdGFuY2VvZiBHcmFwaEVkZ2UpIHJldHVybiBmYWxzZTtcblxuICAgIHJldHVybiB0aGlzLm5vZGVfb25lICYmIHRoaXMubm9kZV9vbmUuZXF1YWxzKG90aGVyLm5vZGVfb25lKSAmJlxuICAgICAgICAgICB0aGlzLm5vZGVfdHdvICYmIHRoaXMubm9kZV90d28uZXF1YWxzKG90aGVyLm5vZGVfdHdvKTtcbn1cblxubW9kdWxlLmV4cG9ydHMgPSBHcmFwaEVkZ2U7XG4iLCJcbnZhciBHcmFwaE5vZGUgPSBmdW5jdGlvbihvcHRpb25zKXtcbiAgICB0aGlzLnggPSBvcHRpb25zID8gKG9wdGlvbnMueCB8fCAwKSA6IDA7XG4gICAgdGhpcy55ID0gb3B0aW9ucyA/IChvcHRpb25zLnkgfHwgMCkgOiAwO1xufVxuXG5HcmFwaE5vZGUucHJvdG90eXBlLmVxdWFscyA9IGZ1bmN0aW9uKG90aGVyKXtcbiAgICBpZighb3RoZXIgaW5zdGFuY2VvZiBHcmFwaE5vZGUpIHJldHVybiBmYWxzZTtcblxuICAgIHJldHVybiBvdGhlci54ID09PSB0aGlzLnggJiYgb3RoZXIueSA9PT0gdGhpcy55O1xufVxuXG5tb2R1bGUuZXhwb3J0cyA9IEdyYXBoTm9kZTtcbiIsInZhciBHcmFwaE5vZGUgPSByZXF1aXJlKCcuL2dyYXBoLW5vZGUnKSxcbiAgICBHcmFwaEVkZ2UgPSByZXF1aXJlKCcuL2dyYXBoLWVkZ2UnKTtcblxudmFyIEdyYXBoID0gZnVuY3Rpb24ob3B0aW9ucyl7XG4gICAgdGhpcy5ub2RlcyA9IG9wdGlvbnMgPyAob3B0aW9ucy5ub2RlcyB8fCBbXSkgOiBbXTtcbiAgICB0aGlzLmVkZ2VzID0gb3B0aW9ucyA/IChvcHRpb25zLmVkZ2VzIHx8IFtdKSA6IFtdO1xufVxuXG5HcmFwaC5wcm90b3R5cGUuZXF1YWxzID0gZnVuY3Rpb24ob3RoZXIpe1xuICAgIGlmKCFvdGhlciBpbnN0YW5jZW9mIEdyYXBoKSByZXR1cm4gZmFsc2U7XG5cbiAgICAvLyBUT0RPXG59XG5cbm1vZHVsZS5leHBvcnRzID0gR3JhcGg7XG4iXX0=
