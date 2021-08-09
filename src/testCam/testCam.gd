extends Spatial

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		$Spatial.rotation.y += event.relative.x * -0.005
		$Spatial/Camera.rotation.x += event.relative.y * -0.005
func _physics_process(delta: float) -> void:
	var diff :Vector3= ($Spatial/Camera/Position3D.global_transform.origin - global_transform.origin)*0.03
	if Input.is_action_pressed("ui_up"):
		global_transform.origin += diff
	if Input.is_action_pressed("ui_down"):
		global_transform.origin -= diff
	if Input.is_action_pressed("ui_right"):
		global_transform.origin -= diff.rotated( Vector3.UP , PI/2 )
	if Input.is_action_pressed("ui_left"):
		global_transform.origin -= diff.rotated( Vector3.UP , -PI/2 )
	
	if Input.is_action_just_pressed("r"):
		get_tree().reload_current_scene()
