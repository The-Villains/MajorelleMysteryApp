extends TextureButton

var current_scene

func _ready():
	current_scene = get_node("dummy").get_parent().get_parent()

func _on_left_nav_pressed():
	current_scene.activate("load", null)
