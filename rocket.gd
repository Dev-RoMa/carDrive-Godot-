extends Area

func _physics_process(delta):
	translation += get_transform().basis.z*50*delta

func _on_rocket_body_entered(body):
	if body.get_class() == "RigidBody" || body.get_class() == "StaticBody" || body.get_class()== "VehicleBody":
		$explosion.monitoring = true

func _on_explosion_body_entered(body):
	var bodies = $explosion.get_overlapping_bodies()
	for body in bodies:
		if body.get_class() == "RigidBody" || body.get_class() == "VehicleBody":
			body.apply_impulse(Vector3.ZERO,(body.global_transform.origin-global_transform.origin).normalized()*100)
		queue_free()
