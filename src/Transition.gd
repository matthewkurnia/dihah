extends ColorRect


signal transition_apex()


func _ready():
	material.set_shader_param("fade", 0)


func play_transition():
	$AnimationPlayer.play("Transition")


func on_transition_apex():
	emit_signal("transition_apex")
