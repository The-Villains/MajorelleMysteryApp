extends LinkButton

var root
var current_scene

# Called when the node enters the scene tree for the first time.
func _ready():
	current_scene = get_parent().get_parent().get_node("open_album")
	root = get_node("/root/main")

func _pressed():
	OS.shell_open("https://musee-ecole-de-nancy.nancy.fr/la-villa-majorelle-2887.html")
	current_scene.hide()
	root.load_menu(ProjectSettings.get("ui/credits"))

func _on_LinkButton_mouse_entered():
	get_parent().get_node("www").is_hovered()
	get_parent().get_node("www").set_toggle_mode(true)
