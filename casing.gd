extends Area

var damage = 0.2

func _physics_process(delta):
	translation += get_transform().basis.z*50*delta

func _on_casing_body_entered(body):
	#damage to enemies
	if body.is_in_group("Enemies"):
		body.cur_hit -= damage
		queue_free()
	#knockback
	if body.get_class() == "RigidBody" || body.get_class() == "StaticBody" || body.get_class()== "VehicleBody":
		$knockback.monitoring = true

func _on_knockback_body_entered(body):
	var bodies = $knockback.get_overlapping_bodies()
	for body in bodies:
		if body.get_class() == "RigidBody" || body.get_class() == "VehicleBody":
			body.apply_impulse(Vector3.ZERO,(body.global_transform.origin-global_transform.origin).normalized()*10)
		queue_free()
