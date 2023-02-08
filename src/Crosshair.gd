extends Node2D


const EAGERNESS := 0.2
const WOBBLE_AMOUNT := 1.5
const FPS := 18.0

export var crosshair_kill_position := Vector2()
export var crosshair_spare_position := Vector2()
export var deer_kill_position := Vector2()
export var deer_spare_position := Vector2()

onready var crosshair_target_position := crosshair_kill_position
onready var deer_target_position := deer_kill_position
onready var crosshair := $Crosshair
onready var deer := $Deer
onready var lens := $Crosshair/Lens

var time_relapsed := 0.0


func _ready():
	Controller.connect("state_changed", self, "on_state_change")
	on_state_change(Controller.state)


func on_state_change(state) -> void:
	match state:
		Controller.Choice.YES:
			crosshair_target_position = crosshair_kill_position
			deer_target_position = deer_kill_position
		Controller.Choice.NO:
			crosshair_target_position = crosshair_spare_position
			deer_target_position = deer_spare_position


func _physics_process(delta):
	time_relapsed += delta
	if time_relapsed < 1 / FPS:
		return
	time_relapsed = 0.0
	deer.position = lerp(deer.position, deer_target_position, 0.5 * EAGERNESS)
	crosshair.position = lerp(crosshair.position, crosshair_target_position, EAGERNESS)
	crosshair.position.x += randf() * WOBBLE_AMOUNT
	crosshair.position.y += randf() * WOBBLE_AMOUNT
	crosshair.position.x += randf() * WOBBLE_AMOUNT
	crosshair.position.y += randf() * WOBBLE_AMOUNT
