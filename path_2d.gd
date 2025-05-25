extends Path2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _draw() -> void:
	draw_line(Vector2.ZERO, Vector2(100, 300), Color.AQUAMARINE, 10.0, true)
	draw_polyline(self.curve.get_baked_points(), Color.AQUAMARINE, 5, true)
	# draw_rect(Rect2(1.0, 1.0, 3.0, 3.0), Color.GREEN)
	# draw_rect(Rect2(5.5, 1.5, 2.0, 2.0), Color.GREEN, false, 1.0)
	# draw_rect(Rect2(9.0, 1.0, 5.0, 5.0), Color.GREEN)
	# draw_rect(Rect2(16.0, 2.0, 3.0, 3.0), Color.GREEN, false, 2.0)
