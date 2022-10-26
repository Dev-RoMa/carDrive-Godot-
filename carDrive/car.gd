extends VehicleBody

func _physics_process(delta):
		steering = Input.get_axis("right","left") * 0.4
		engine_force = Input.get_axis("back","forward") * 100


func _process(delta):
	if Input.is_action_just_pressed("lookback"):
		$rearCamera.set_current(true)
	elif Input.is_action_just_pressed("changeCamera"):
		$Camera.set_current(true)
