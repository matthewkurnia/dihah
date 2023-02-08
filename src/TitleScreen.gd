extends Node2D


signal title_exit()


func _input(event):
	if event is InputEventKey and event.is_pressed() and not event.is_echo():
		emit_signal("title_exit")
