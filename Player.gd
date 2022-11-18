extends VehicleBody

#vehicle variables
#variables for the rocket
onready var muzzle = get_node("gun/muzzle")
onready var rocket_scn = preload("res://rocket.tscn")
var rfire_rate = 1
var rcan_fire = true

#variables for the firegun
onready var tip = get_node("firegun/tip")
onready var casing_scn = preload("res://casing.tscn")
var gfire_rate = 0.2
var gcan_fire = true


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
	#for_rocket
	if Input.is_action_pressed("pewpew"):
		if rcan_fire == true:
			var rocket = rocket_scn.instance()
			muzzle.add_child(rocket)
			rocket.set_as_toplevel(true)
			rcan_fire = false
			yield(get_tree().create_timer(rfire_rate),"timeout")
			rcan_fire = true
	if Input.is_action_pressed("pewgun"):
		if gcan_fire == true:
			var casing = casing_scn.instance()
			tip.add_child(casing)
			casing.set_as_toplevel(true)
			gcan_fire = false
			yield(get_tree().create_timer(gfire_rate),"timeout")
			gcan_fire = true

#inputs are gfire_rate 6& gcan_fire
