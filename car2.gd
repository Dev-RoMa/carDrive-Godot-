extends VehicleBody

var cur_hit = 10
var max_hit = 10

func _physics_process(delta):
#	#dead_car
	if cur_hit <= 0:
		engine_force = 0
