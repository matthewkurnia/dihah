extends Node


signal state_changed(state)

enum Choice { NO, YES }

var state = Choice.NO


func _unhandled_input(event):
	if (
		event is InputEventKey and
		event.is_pressed() and
		not event.is_echo() and
		not event.is_action_pressed("ui_cancel")
	):
		toggle_state()
		print("state changed to " + str(state))


func toggle_state() -> void:
	state = (state + 1) % 2
	emit_signal("state_changed", state)


func on_scene_change() -> void:
	state = Choice.NO
	emit_signal("state_changed", state)
	print("state reset to " + str(state))
	pass
