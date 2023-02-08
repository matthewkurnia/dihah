extends Node


signal done()

const SUBJECTS := [
	"dog",
	"cat",
	"bible",
	"human",
	"sheep",
	"snake",
	"octopus",
	"hand",
	"boa",
	"fish",
	"armor",
	"robot",
	"android"
]

const REVEAL_TEXT := {
	"dog": "a dog",
	"cat": "a cat",
	"bible": "a bible",
	"human": "Jimmy",
	"sheep": "a sheep",
	"snake": "a snake",
	"octopus": "an octopus",
	"hand": "a hand",
	"boa": "a boa eating an elephant",
	"fish": "a grilled fish",
	"armor": "a suit of armor",
	"robot": "a robot",
	"android": "an android"
}

const DESCRIPTION := {
	"dog": "Just a dog!",
	"cat": "They can fit into anything!",
	"bible": "My son, give me your heart and let your eyes delight in my ways ~Proverbs 23:26",
	"human": "Is anyone out there?",
	"sheep": "Baa.",
	"snake": "It's venom may stop your heartbeat!",
	"octopus": "They have 3 hearts!",
	"hand": "Where's the rest?",
	"boa": "A prized possesion of a once petit prince.",
	"fish": "Not anymore, you murderer.",
	"armor": "Uhh.. Is someone in there? Or...",
	"robot": "Beep B00p",
	"android": "48 45 4C 50 20 4D 45 21"
}

const ANSWERS := {
	"dog": 1,
	"cat": 1,
	"bible": 0,
	"human": 1,
	"sheep": 1,
	"snake": 1,
	"octopus": 1,
	"hand": 0,
	"boa": 1,
	"fish": 0,
	"armor": 2,
	"robot": 0,
	"android": 0
}


var subjects := {}
var active_subject := "dog"
var choice_made := false

onready var subject_container := $SubjectContainer
onready var subject_root := $SubjectContainer/Subject
onready var description_label := $DescriptionTextContainer/Label
onready var reveal_label := $RevealTextContainer/Label
onready var marshall := $Marshall
onready var animation_player := $AnimationPlayer


func _init():
	for subject in SUBJECTS:
		var image_texture := load("res://assets/visuals/images/%s.png" % subject)
		var outline_texture := load("res://assets/visuals/outlines/%s.png" % subject)
		var container := Node2D.new()
		var image_sprite := Sprite.new()
		var outline_sprite := Sprite.new()
		image_sprite.texture = image_texture
		image_sprite.visible = false
		image_sprite.name = "Image"
		outline_sprite.texture = outline_texture
		outline_sprite.name = "Outline"
		container.add_child(image_sprite)
		container.add_child(outline_sprite)
		container.name = subject
		subjects[subject] = container


func _ready():
	for subject in subjects.values():
		subject_root.add_child(subject)
	self.call_deferred("initialize_with_subject", active_subject)
	Controller.connect("choice_made", self, "on_choice_made")


func initialize_with_subject(subject: String):
	subject_container.set_visible_subject(subject)
	description_label.text = DESCRIPTION[subject]
	reveal_label.text = "It's %s!" % REVEAL_TEXT[subject]


func on_choice_made(choice):
	if choice_made:
		return
	choice_made = true
	yield(get_tree().create_timer(1.0), "timeout")
	if choice == ANSWERS[active_subject]:
		marshall.show_with_correctness(1)
	elif ANSWERS[active_subject] == 2:
		marshall.show_with_correctness(2)
	else:
		marshall.show_with_correctness(0)
	yield(get_tree().create_timer(1.0), "timeout")
	animation_player.play("Guess")
	yield(animation_player, "animation_finished")
	emit_signal("done")
