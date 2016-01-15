_ = require "lodash"
GraphUtils = require "./graph-utils"
GraphNode = require "./graph-node"

MazeNode = (options) ->
    options = options or {}

    GraphNode.call(this,options)
    @is_wall = options.is_wall or false
    return # have to explicitly return, otherwise options.is_wall will get returned
           # when present, instead of 'this'

MazeNode.prototype.equals = (other) ->
    return false unless GraphUtils.quacks_like_a_maze_node(other)
    equal = GraphNode.prototype.equals.call(this) and
            (@is_wall is other.is_wall);
    
    return equal

_.extend(MazeNode.prototype, GraphNode.prototype)
module.exports = MazeNode
