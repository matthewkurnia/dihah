extends ColorRect


signal done()

enum Correctness { FALSE, TRUE, AMBIGUOUS }

const MESSAGES = [
	["WRONG!", "NOPE!", "FALSE!"],
	["CORRECT!"],
	["????????"]
]

export var incorrect_color: Color
export var correct_color: Color
export var ambiguous_color: Color

onready var label = $CenterContainer/Label
onready var animation_player = $AnimationPlayer
onready var colors = [
	incorrect_color,
	correct_color,
	ambiguous_color
]


func _ready():
	self.modulate = Color.transparent
	animation_player.connect("animation_finished", self, "on_show_finished")


func show_with_correctness(correctness) -> void:
	var choices = MESSAGES[correctness]
	label.text = choices[randi() % len(choices)]
	color = colors[correctness]
	animation_player.play("Show")


func on_show_finished(_anim_name) -> void:
	emit_signal("done")
