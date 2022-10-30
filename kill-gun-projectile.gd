extends Area

var dir = Vector3()
var bulletSpeed = 150
var dmg = 25 #ammount of dmg to be dealth

func _ready() -> void:
	set_as_toplevel(true)

func _process(delta: float) -> void:
	translation -= transform.basis.x * bulletSpeed * delta

func _on_killgunprojectile_body_entered(body: Node) -> void:
	if body.is_in_group("Enemy"):
		body.take_damage(dmg)
	
	queue_free()
	
func _on_BulletTimer_timeout() -> void:
	queue_free()
