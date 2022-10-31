extends VehicleBody

signal health_updated(health)
signal killed()

export (float) var max_health = 100

onready var health = max_health setget _set_health

func damage(amount):
	_set_health(health - amount)

func kill():
	pass

func _set_health(value):
	var prev_health = health
	health = clamp(value, 0, max_health)
	if health != prev_health:
		emit_signal("health_updated", health)
		if health == 0:
			kill()
			emit_signal("killed")


#vehicle driving
func _physics_process(delta):
		steering = Input.get_axis("left2","right2") * 0.4
		engine_force = Input.get_axis("back2","forward2") * 100
		if health == 0:
			engine_force = 0

#vehicle cameras
func _process(delta):
	if Input.is_action_just_pressed("changeCamera2"):
		$Camera.set_current(true)


func _on_car2_body_entered(body):
	pass # Replace with function body.
