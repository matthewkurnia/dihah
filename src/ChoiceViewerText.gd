extends Node2D


const stride := 35


export var yes_color: Color = Color.white
export var no_color: Color = Color.white
export var inactive_color: Color = Color.white
export var choice_made := false

onready var pointer := $Pointer
onready var yes := $Yes
onready var no := $No


func _ready():
	Controller.connect("state_changed", self, "on_state_change")
	on_state_change(Controller.state)


func on_state_change(state):
	if choice_made:
		return
	match state:
		Controller.Choice.YES:
			pointer.rect_position.y = 0
			yes.modulate = yes_color
			no.modulate = inactive_color
			yes.use_parent_material = true
			no.use_parent_material = false
		Controller.Choice.NO:
			pointer.rect_position.y = stride
			yes.modulate = inactive_color
			no.modulate = no_color
			yes.use_parent_material = false
			no.use_parent_material = true
