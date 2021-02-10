extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_end_game_pressed():
	get_node("/root/main").load_menu(ProjectSettings.get("ui/main_menu"))
