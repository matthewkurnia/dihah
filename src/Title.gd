extends Node2D


const vertical_resolution := 480
const stride := 30

#onready var title_scene := preload("res://src/Title.tscn")


func _ready():
	$DoesIt.visible_characters = 0
	$HaveA.visible_characters = 0
	$Heartbeat.visible_characters = 0


func cycle_finished() -> void:
	var title_instance := self.duplicate()
	title_instance.position.x = self.position.x
	title_instance.position.y = fmod(self.position.y + stride, vertical_resolution)
	get_parent().add_child(title_instance)
