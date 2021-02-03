extends TextureButton

var current_scene

func _ready():
	current_scene = get_parent()

func _on_area_pressed():
	current_scene.activate("load", null)
