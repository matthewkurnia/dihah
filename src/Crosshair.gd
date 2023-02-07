extends Node2D


const EAGERNESS := 0.2
const WOBBLE_AMOUNT := 1.5
const FPS := 18.0

export var kill_pos := Vector2()
export var spare_pos := Vector2()

onready var target_position := kill_pos
onready var lens := $Lens

var time_relapsed := 0.0


func _ready():
	Controller.connect("state_changed", self, "on_state_change")
	on_state_change(Controller.state)


func on_state_change(state) -> void:
	match state:
		Controller.Choice.YES:
			target_position = kill_pos
		Controller.Choice.NO:
			target_position = spare_pos


func _physics_process(delta):
	time_relapsed += delta
	if time_relapsed < 1 / FPS:
		return
	time_relapsed = 0.0
	position = lerp(position, target_position, EAGERNESS)
	position.x += randf() * WOBBLE_AMOUNT
	position.y += randf() * WOBBLE_AMOUNT
	position.x += randf() * WOBBLE_AMOUNT
	position.y += randf() * WOBBLE_AMOUNT
