extends Node


signal state_changed(state)
signal choice_made(state)

enum Choice { NO, YES }

var state = Choice.NO
var selection_confirmed := false


func _unhandled_input(event):
	if select(event):
		confirm_selection()
	elif toggle(event) and not selection_confirmed:
		toggle_state()
		print("state changed to " + str(state))


func select(event) -> bool:
	return event.is_action_pressed("select") and not event.is_echo()


func toggle(event) -> bool:
	return event.is_action_pressed("toggle_selection") and not event.is_echo()


func toggle_state() -> void:
	state = (state + 1) % 2
	emit_signal("state_changed", state)


func confirm_selection() -> void:
	selection_confirmed = true
	emit_signal("choice_made", state)


func on_scene_change() -> void:
	selection_confirmed = false
	state = Choice.NO
	emit_signal("state_changed", state)
	print("state reset to " + str(state))
	pass
