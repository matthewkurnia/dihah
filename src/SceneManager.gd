extends Node


signal scene_change()

const TITLE_SCREEN_PS = preload("res://src/TitleScreen.tscn")
const TUTORIAL_PS = preload("res://src/Tutorial.tscn")
const REGULAR_QUESTION_PS = preload("res://src/RegularQuestion.tscn")
const VIGNETTE_1_PS = preload("res://src/Vignette1.tscn")
const VIGNETTE_2_PS = preload("res://src/Vignette2.tscn")
const VIGNETTE_3_PS = preload("res://src/Vignette3.tscn")
const CREDITS_PS = preload("res://src/Credits.tscn")

export var glitchy_transition_path: NodePath
export var nice_transition_path: NodePath

onready var glitchy_transition = get_node(glitchy_transition_path)
onready var nice_transition = get_node(nice_transition_path)


func _ready():
	self.connect("scene_change", Controller, "on_scene_change")
	self.call_deferred("run_game_sequence")


func run_game_sequence():
	var title_screen = TITLE_SCREEN_PS.instance()
	self.add_child(title_screen)
	emit_signal("scene_change")
	
	yield(title_screen, "title_exit")
	
	nice_transition.play_transition()
	yield(nice_transition, "transition_apex")
	
	title_screen.queue_free()
	var tutorial = TUTORIAL_PS.instance()
	self.add_child(tutorial)
	emit_signal("scene_change")
	
	yield(Controller, "choice_made")
	if Controller.state == Controller.Choice.NO:
		yield(get_tree().create_timer(0.5), "timeout")
		glitchy_transition.play_transition()
		yield(glitchy_transition, "transition_apex")
		tutorial.queue_free()
		self.call_deferred("run_game_sequence")
		print("YOU FOOL.")
		return
	
	yield(get_tree().create_timer(0.5), "timeout")
	nice_transition.play_transition()
	yield(nice_transition, "transition_apex")
	
	var level
	
	
	tutorial.queue_free()
	level = REGULAR_QUESTION_PS.instance()
	level.active_subject = "dog"
	self.add_child(level)
	emit_signal("scene_change")
	
	yield(level, "done")
	yield(Controller, "choice_made")
	
	nice_transition.play_transition()
	yield(nice_transition, "transition_apex")
	
	
	level.queue_free()
	level = REGULAR_QUESTION_PS.instance()
	level.active_subject = "cat"
	self.add_child(level)
	emit_signal("scene_change")

	yield(level, "done")
	yield(Controller, "choice_made")

	nice_transition.play_transition()
	yield(nice_transition, "transition_apex")


	level.queue_free()
	level = REGULAR_QUESTION_PS.instance()
	level.active_subject = "bible"
	self.add_child(level)
	emit_signal("scene_change")

	yield(level, "done")
	yield(Controller, "choice_made")

	glitchy_transition.play_transition()
	yield(glitchy_transition, "transition_apex")


	level.queue_free()
	level = VIGNETTE_1_PS.instance()
	self.add_child(level)
	emit_signal("scene_change")

	yield(get_tree().create_timer(1.0), "timeout")
	yield(Controller, "choice_made")

	glitchy_transition.play_transition()
	yield(glitchy_transition, "transition_apex")


	level.queue_free()
	level = REGULAR_QUESTION_PS.instance()
	level.active_subject = "human"
	self.add_child(level)
	emit_signal("scene_change")

	yield(level, "done")
	yield(Controller, "choice_made")

	nice_transition.play_transition()
	yield(nice_transition, "transition_apex")


	level.queue_free()
	level = REGULAR_QUESTION_PS.instance()
	level.active_subject = "sheep"
	self.add_child(level)
	emit_signal("scene_change")

	yield(level, "done")
	yield(Controller, "choice_made")

	nice_transition.play_transition()
	yield(nice_transition, "transition_apex")


	level.queue_free()
	level = REGULAR_QUESTION_PS.instance()
	level.active_subject = "snake"
	self.add_child(level)
	emit_signal("scene_change")

	yield(level, "done")
	yield(Controller, "choice_made")

	nice_transition.play_transition()
	yield(nice_transition, "transition_apex")


	level.queue_free()
	level = REGULAR_QUESTION_PS.instance()
	level.active_subject = "octopus"
	self.add_child(level)
	emit_signal("scene_change")

	yield(level, "done")
	yield(Controller, "choice_made")

	nice_transition.play_transition()
	yield(nice_transition, "transition_apex")


	level.queue_free()
	level = REGULAR_QUESTION_PS.instance()
	level.active_subject = "hand"
	self.add_child(level)
	emit_signal("scene_change")

	yield(level, "done")
	yield(Controller, "choice_made")

	nice_transition.play_transition()
	yield(nice_transition, "transition_apex")


	level.queue_free()
	level = REGULAR_QUESTION_PS.instance()
	level.active_subject = "boa"
	self.add_child(level)
	emit_signal("scene_change")

	yield(level, "done")
	yield(Controller, "choice_made")

	nice_transition.play_transition()
	yield(nice_transition, "transition_apex")


	level.queue_free()
	level = REGULAR_QUESTION_PS.instance()
	level.active_subject = "fish"
	self.add_child(level)
	emit_signal("scene_change")

	yield(level, "done")
	yield(Controller, "choice_made")

	glitchy_transition.play_transition()
	yield(glitchy_transition, "transition_apex")
	
	
	level.queue_free()
	level = VIGNETTE_2_PS.instance()
	level.use_blackout = true
	level.text_scroll_done = true
	self.add_child(level)
	emit_signal("scene_change")
	
	yield(level, "done")
	
	glitchy_transition.play_transition()
	yield(glitchy_transition, "transition_apex")
	
	
	level.queue_free()
	level = REGULAR_QUESTION_PS.instance()
	level.active_subject = "armor"
	self.add_child(level)
	emit_signal("scene_change")
	
	yield(level, "done")
	yield(Controller, "choice_made")
	
	nice_transition.play_transition()
	yield(nice_transition, "transition_apex")


	level.queue_free()
	level = REGULAR_QUESTION_PS.instance()
	level.active_subject = "robot"
	self.add_child(level)
	emit_signal("scene_change")

	yield(level, "done")
	yield(Controller, "choice_made")

	nice_transition.play_transition()
	yield(nice_transition, "transition_apex")


	level.queue_free()
	level = REGULAR_QUESTION_PS.instance()
	level.active_subject = "android"
	self.add_child(level)
	emit_signal("scene_change")

	yield(level, "done")
	yield(Controller, "choice_made")

	glitchy_transition.play_transition()
	yield(glitchy_transition, "transition_apex")


	level.queue_free()
	level = VIGNETTE_3_PS.instance()
	self.add_child(level)
	emit_signal("scene_change")

	yield(get_tree().create_timer(1.0), "timeout")
	yield(Controller, "choice_made")

	glitchy_transition.play_transition()
	yield(glitchy_transition, "transition_apex")


	level.queue_free()
	level = CREDITS_PS.instance()
	self.add_child(level)
	emit_signal("scene_change")

	yield(get_tree().create_timer(1.0), "timeout")
	yield(Controller, "choice_made")

	glitchy_transition.play_transition()
	yield(glitchy_transition, "transition_apex")
	
	
	level.queue_free()
	self.call_deferred("run_game_sequence")
