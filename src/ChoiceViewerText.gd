extends Node2D


const STRIDE := 35
const PARTICLES_PACKED_SCENE := preload("res://src/SelectionParticles.tscn")
const PARTICLES_OFFSET := Vector2(21.0, 17.0)

export var yes_color: Color = Color.white
export var no_color: Color = Color.white
export var inactive_color: Color = Color.white

onready var pointer := $Pointer
onready var yes := $Yes
onready var no := $No

var choice_made := false


func _ready():
	Controller.connect("state_changed", self, "on_state_change")
	Controller.connect("choice_made", self, "on_choice_made")
	on_state_change(Controller.state)


func on_state_change(state):
	match state:
		Controller.Choice.YES:
			pointer.rect_position.y = 0
			yes.modulate = yes_color
			no.modulate = inactive_color
			yes.use_parent_material = true
			no.use_parent_material = false
		Controller.Choice.NO:
			pointer.rect_position.y = STRIDE
			yes.modulate = inactive_color
			no.modulate = no_color
			yes.use_parent_material = false
			no.use_parent_material = true


func on_choice_made(state):
	if choice_made:
		return
	choice_made = true
	on_state_change(state)
	var selection_particles = PARTICLES_PACKED_SCENE.instance()
	match state:
		Controller.Choice.YES:
			selection_particles.position = yes.rect_position + PARTICLES_OFFSET
			no.visible = false
		Controller.Choice.NO:
			selection_particles.position = no.rect_position + PARTICLES_OFFSET
			yes.visible = false
	self.add_child(selection_particles)
