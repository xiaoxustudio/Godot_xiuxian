extends Area2D
class_name turns

signal reshow
export(String,FILE,"*.tscn") var Sence:String
export var data_map:Array


func _input_event(_viewport, event, _shape_idx):
	if not event.is_action_pressed("lclick"):
		return
	_reshow()
	
	



func _reshow():
	emit_signal("reshow")
	Fun.setSce(Sence,data_map)


