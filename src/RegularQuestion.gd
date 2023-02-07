extends Node2D


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
	"boa": "a boa eating and elephant",
	"fish": "a grilled fish",
	"armor": "a suit of armor",
	"robot": "a robot",
	"android": "an android"
}

const DESCRIPTION := {
	"dog": "Just a dog!",
	"cat": "They can fit into anything!",
	"bible": "My son, give me your heart and let your eyes delight in my ways ~Proverbs 23:26",
	"human": "Is somebody out there?",
	"sheep": "Baa.",
	"snake": "It's venom may stop your heartbeat!",
	"octopus": "They have 3 hearts!",
	"hand": "Where's the rest?",
	"boa": "A priced possesion of a once petit prince.",
	"fish": "Not anymore, you murderer.",
	"armor": "Uhh.. Is someone in there? Or...",
	"robot": "Beep B00p",
	"android": "48 45 4C 50 20 4D 45 21"
}


var subjects := {}

onready var subject_container := $SubjectContainer
onready var subject_root := $SubjectContainer/Subject
onready var description_label := $DescriptionTextContainer/Label
onready var reveal_label := $RevealTextContainer/Label


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
	self.call_deferred("initialize_with_subject", "dog")


func initialize_with_subject(subject: String):
	subject_container.set_visible_subject(subject)
	description_label.text = DESCRIPTION[subject]
	reveal_label.text = "It's %s!" % REVEAL_TEXT[subject]
