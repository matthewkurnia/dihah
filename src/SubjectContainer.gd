extends Node2D


var current_subject: Node2D


func _ready():
	$Subject/Placeholder.visible = false


func set_visible_subject(subject: String) -> bool:
	var set_successful := false
	for node in $Subject.get_children():
		if node is Node2D:
			if node.name == subject:
				node.visible = true
				set_successful = true
				current_subject = node
			else:
				node.visible = false
	return set_successful


func show_subject():
	current_subject.get_node("Image").visible = true
	current_subject.get_node("Outline").visible = false
