tool
extends Label


export var time_left := 5.0;


func _process(delta):
	self.text = str("%.2f" % time_left)
