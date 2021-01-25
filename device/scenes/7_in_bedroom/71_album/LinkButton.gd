extends LinkButton


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _pressed():
	OS.shell_open("https://musee-ecole-de-nancy.nancy.fr/la-villa-majorelle-2887.html")
