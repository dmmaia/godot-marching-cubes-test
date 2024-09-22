extends MeshInstance3D

func _ready():
	#DrawGizmos(Vector3(0,0,0), 10, Color(1,1,1))
	pass
	
func DrawGizmos(location, size, color):
	var scene_root = get_tree().root.get_children()[0]

	var sphere = SphereMesh.new()
	sphere.radial_segments = 4
	sphere.rings = 4
	sphere.radius = size
	sphere.height = size * 2

	var material = StandardMaterial3D.new()
	material.albedo_color = color
	material.flags_unshaded = true
	sphere.surface_set_material(0, material)
	
	var node = MeshInstance3D.new()
	node.mesh = sphere
	node.global_transform.origin = location
	scene_root.add_child.call_deferred(node)
