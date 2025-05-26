extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var pos1: Vector2 = $Vertex.global_position
	var pos2: Vector2 = $Vertex2.global_position
	$Edge.set_pos0(pos1)
	$Edge.set_pos1(pos2)

func _physics_process(delta: float) -> void:
	#var mpos = get_viewport().get_mouse_position()
	#$Vertex.position = mpos
	#print(mpos)
	pass
