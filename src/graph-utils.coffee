GraphUtils = {
    quacks_like_a_graph_node: (node) ->
        return false unless node and typeof node.x is "number" and typeof node.y is "number"
        true

    quacks_like_a_graph_edge: (edge) ->
        return false unless edge and 
                            this.quacks_like_a_graph_node(edge.node_one) and
                            this.quacks_like_a_graph_node(edge.node_two)
        true

    quacks_like_a_graph: (graph) ->
        return false unless graph and
                            graph.nodes instanceof Array and
                            graph.edges instanceof Array
        true

    quacks_like_a_maze_node: (maze_node) ->
        return false unless maze_node and
                            this.quacks_like_a_graph_node(maze_node) and
                            typeof maze_node.is_wall is "boolean"
        true
}

module.exports = GraphUtils
