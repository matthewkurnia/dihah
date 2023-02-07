tool
extends Sprite


func _process(delta):
	material.set_shader_param("center", global_position)
