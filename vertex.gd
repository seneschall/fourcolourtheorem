class_name Vertex
extends AnimatableBody2D

signal position_changed

var dragging := false
var of := Vector2.ZERO
var color: Color
const colors := [Color.RED, Color.BLUE, Color.GREEN, Color.BROWN]


func _process(delta: float) -> void:
	if dragging:
		position = get_global_mouse_position() - of
		position_changed.emit()


func _on_button_button_down() -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		dragging = true
		print("left")
		of = get_global_mouse_position() - global_position
	elif Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		print("right")
		$ColorRect.color = colors.pick_random()


func _on_button_button_up() -> void:
	dragging = false
