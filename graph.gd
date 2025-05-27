extends Node2D

var vertex_scene := preload("res://vertex.tscn")

var adj: Array  # Array[Array[int]] adjacency list of all vertex_idx; index of list is index of vertex
var vertex_idx: Dictionary[Vertex, int]  # Dictionary[Vertex, int] where int is the index of a given vertex
var idx_vertex: Array[Vertex]

var last_idx: int = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func add_vertex(pos: Vector2 = Vector2.ZERO) -> Vertex:
	var new_vertex: Vertex = vertex_scene.instantiate()
	new_vertex.position = pos
	adj.push_back([])
	idx_vertex.push_back(new_vertex)
	vertex_idx[new_vertex] = last_idx
	last_idx += 1
	return new_vertex


func remove_vertex(idx: int) -> void:
	adj[idx] = []
	idx_vertex[idx] = null
	var v: Vertex = vertex_idx.find_key(idx)
	vertex_idx.erase(v)


func add_edge(from: Vertex, to: Vertex) -> void:
	var from_idx: int = get_index_of(from)
	var to_idx: int = get_index_of(to)

	# since the graph is undirected, we need to add both vertex_idx in both adjacency lists
	adj[from_idx] = to_idx
	adj[to_idx] = from_idx


# func remove_edge(from: Vertex, to: Vertex) -> void:
# 	pass


func get_index_of(v: Vertex) -> int:
	return vertex_idx[v]


func get_vertex_at(idx: int) -> Vertex:
	return idx_vertex[idx]


func get_neighbours_of(v: Vertex) -> Array[Vertex]:
	return adj[get_index_of(v)]
