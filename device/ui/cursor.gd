extends Sprite

var arrow = load("res://globals/sprites/knoepfe und co/hand-action.png")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_custom_mouse_cursor(arrow)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
