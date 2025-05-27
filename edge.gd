extends Node2D

var pos0 := Vector2.ZERO
var pos1 := Vector2.ZERO


func _process(delta: float) -> void:
	queue_redraw()


func _draw() -> void:
	draw_line(pos0, pos1, Color.BLACK, 5.0, true)


func set_pos0(pos: Vector2) -> void:
	pos0 = pos


func set_pos1(pos: Vector2) -> void:
	pos1 = pos
