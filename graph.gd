extends Node2D

var vertex_scene := preload("res://vertex.tscn")

var adj: Array  # Array[Array[int]] adjacency list of all vertex_idx; index of list is index of vertex
# maybe I should create a separate adjacency list for printing so I don't draw the edges twice?
var vertex_idx: Dictionary[Vertex, int]  # Dictionary[Vertex, int] where int is the index of a given vertex
var idx_vertex: Array[Vertex]

var last_idx: int = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var v := Vector2(960.0, 545.0)
	var v1 := add_vertex(v + Vector2.RIGHT * 40)
	var v2 := add_vertex(v + Vector2.LEFT * 40)
	var v3 := add_vertex(v + Vector2.DOWN * 40)
	add_edge(v1, v2)
	add_edge(v2, v3)
	add_edge(v1, v3)
	print(idx_vertex)
	print("adj: ", adj)
	# queue_redraw()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# queue_redraw()
	pass


func add_vertex(pos: Vector2 = Vector2.ZERO) -> Vertex:
	var new_vertex: Vertex = vertex_scene.instantiate()
	$Vertices.add_child(new_vertex)
	new_vertex.position_changed.connect(_on_vertex_position_changed)

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
	adj[from_idx].append(to_idx)
	adj[to_idx].append(from_idx)


# func remove_edge(from: Vertex, to: Vertex) -> void:
# 	pass


func get_index_of(v: Vertex) -> int:
	return vertex_idx[v]


func get_vertex_at(idx: int) -> Vertex:
	return idx_vertex[idx]


func get_neighbours_of(v: Vertex) -> Array[Vertex]:
	return adj[get_index_of(v)]


func _on_vertex_position_changed():
	print("position changed")
	queue_redraw()


func _draw() -> void:
	# draw_line(Vector2.ZERO, Vector2(500.0, 400.0), Color.BLACK, 5.0, true)
	# draw_line(Vector2(1000.0, 540.0), Vector2(920.0, 539.0), Color.BLACK, 5.0, true)
	print("redrawing")
	for i in range(len(adj)):
		var from: Vertex = get_vertex_at(i)
		for j in adj[i]:
			var to: Vertex = get_vertex_at(j)
			draw_line(from.global_position, to.global_position, Color.BLACK, 5.0, true)
