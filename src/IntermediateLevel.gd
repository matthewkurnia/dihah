extends Node


signal done()

export var text_scroll_done := false

onready var blackout = $Blackout

var use_blackout = false


func _ready():
	blackout.visible = false
	Controller.connect("choice_made", self, "on_choice_made")
	if Config.DEBUG:
		$AnimationPlayer.playback_speed = 10
	yield(get_tree().create_timer(10), "timeout")
	on_choice_made(null)


func _input(event):
	if not text_scroll_done:
		get_tree().set_input_as_handled()


func on_choice_made(choice):
	blackout.visible = use_blackout
	emit_signal("done")
