extends Camera2D
var pull = false
var mousePos
var currentPos
func _physics_process(delta):
	if Input.is_action_just_released("ScrollUp") and Input.is_action_pressed("lcon"):
		if zoom.x >= 0.8 and zoom.y >= 0.8:
			zoom.x -= 0.2
			zoom.y -= 0.2
	if Input.is_action_just_released("ScrollDown") and Input.is_action_pressed("lcon"):
		if zoom.x <= 4 and zoom.y <= 4:
			zoom.x += 0.2
			zoom.y += 0.2
	if Input.is_action_pressed("Con") and Input.is_action_pressed("lcon"):
		mousePos = get_global_mouse_position()
	if Input.is_action_pressed("Con") and Input.is_action_pressed("lcon"):
		currentPos = get_global_mouse_position()
		offset.x -= currentPos.x-mousePos.x
		offset.y -= currentPos.y - mousePos.y




