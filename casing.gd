#extends MeshInstance
#
##pewpew
#
#export var bullet:PackedScene
#
#func _physics_process(delta):
#	if Input.is_action_just_pressed("pewpew") && self.visible == true:
#		self.visible = false
#	else:
#		if Input.is_action_just_pressed("pewpew") && self.visible == false:
#			self.visible = true
