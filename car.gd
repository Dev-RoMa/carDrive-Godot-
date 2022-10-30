extends VehicleBody

#vehicle variables
#onready var muzzle = get_node("car/gun/muzzle")
onready var muzzle = get_node("gun/muzzle")
onready var rocket_scn = preload("res://rocket.tscn")
var fire_rate = 1
var can_fire = true

#vehicle driving
func _physics_process(delta):
		steering = Input.get_axis("right","left") * 0.4
		engine_force = Input.get_axis("back","forward") * 100

#vehicle cameras
func _process(delta):
	if Input.is_action_just_pressed("lookback"):
		$rearCamera.set_current(true)
	elif Input.is_action_just_pressed("changeCamera"):
		$Camera.set_current(true)

#vehicle weapons

func _integrate_forces(state):
	if Input.is_action_pressed("pewpew"):
		if can_fire == true:
			var rocket = rocket_scn.instance()
			muzzle.add_child(rocket)
			rocket.set_as_toplevel(true)
			can_fire = false
			yield(get_tree().create_timer(fire_rate),"timeout")
			can_fire = true
