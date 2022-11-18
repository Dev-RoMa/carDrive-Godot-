extends MeshInstance

func _ready():
	self.get_surface_material(0).albedo_color = Color(0,0,255)
