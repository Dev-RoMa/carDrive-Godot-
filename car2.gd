extends VehicleBody

var cur_hit = 10
var max_hit = 10

var max_rpm = 500
var max_torque = 200

func _physics_process(delta):
	steering = lerp(steering, Input.get_axis("left2","right2")* 0.4, 5*delta)
	var acceleration = Input.get_axis("back2","forward2")
	var rpm = $rear_left_wheel.get_rpm()
	$rear_left_wheel.engine_force = acceleration * max_torque * ( 1 - rpm/max_rpm)
	rpm = $rear_right_wheel.get_rpm()
	$rear_right_wheel.engine_force = acceleration * max_torque * ( 1 - rpm/max_rpm)
#	#dead_car
	if cur_hit <= 0:
		engine_force = 0

##vehicle cameras
func _process(_delta):
	if Input.is_action_just_pressed("changeCamera2"):
		$Camera.set_current(true)


#------------------------------------------------


#



#------------------------------------------------
#onready var health = max_health setget _set_health
#signal health_updated(health)
#signal killed()
#
#export (float) var max_health = 100
#
#func damage(amount):
#	_set_health(health - amount)
#
#func kill():
#	pass
#
#func _set_health(value):
#	var prev_health = health
#	health = clamp(value, 0, max_health)
#	if health != prev_health:
#		emit_signal("health_updated", health)
#		if health == 0:
#			kill()
#			emit_signal("killed")
