extends Node2D


const VERTICAL_RESOLUTION := 480
const STRIDE := 30

#onready var title_scene := preload("res://src/Title.tscn")


func _ready():
	$DoesIt.visible_characters = 0
	$HaveA.visible_characters = 0
	$Heartbeat.visible_characters = 0


func cycle_finished() -> void:
	var title_instance := self.duplicate()
	title_instance.position.x = self.position.x
	title_instance.position.y = fmod(self.position.y + STRIDE, VERTICAL_RESOLUTION + STRIDE)
	get_parent().add_child(title_instance)
