extends Node2D

var action

#Some function that finds out the current action after one of the buttons in the verb menu is pressed.
func get_action():
	pass
	# action = current_action
	
func change_cursor_image():
	if action == "use":
		Input.set_custom_mouse_cursor(get_parent().get_node("hand").texture)
	elif action == "talk":
		Input.set_custom_mouse_cursor(get_parent().get_node("mouth").texture)
	elif action == "look":
		Input.set_custom_mouse_cursor(get_parent().get_node("eye").texture)
	else:
		Input.set_custom_mouse_cursor(get_parent().get_node("normal").texture)

# Called when the node enters the scene tree for the first time.
func _ready():
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	Input.set_custom_mouse_cursor(get_parent().get_node("normal").texture)

	
func _process(_delta):
	#self.position = self.get_global_mouse_position()
	pass
