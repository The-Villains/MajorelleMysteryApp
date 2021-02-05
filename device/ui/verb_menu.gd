extends Control

var vm

var act_buttons = []

var current_action

#Input.set_custom_mouse_cursor(get_node(mouse_image).texture)

func set_action_name(action):
	current_action = action

func action_changed(action):
	get_tree().call_group("game", "set_current_action", action)

	for b in act_buttons:
		b.set_pressed(b.get_name() == action)
	
	Input.set_custom_mouse_cursor(get_parent().get_parent().get_node("mouse/"+action).texture,0,Vector2(-5,-10))
	set_action_name(action)

# Modified behaviour when entering the verb_menu area aka the look, use and talk buttons to show the default or normal mouse cursor
# Entering that area sets the cursor to "Normal" and Exiting the area sets it back to the current selected action if one is active, else the cursor remains normal

func _on_look_mouse_entered():
	Input.set_custom_mouse_cursor(get_parent().get_parent().get_node("mouse/normal").texture)

func _on_use_mouse_entered():
	Input.set_custom_mouse_cursor(get_parent().get_parent().get_node("mouse/normal").texture)

func _on_talk_mouse_entered():
	Input.set_custom_mouse_cursor(get_parent().get_parent().get_node("mouse/normal").texture)

func _on_look_mouse_exited():
	if current_action != null:
		Input.set_custom_mouse_cursor(get_parent().get_parent().get_node("mouse/"+current_action).texture)
	else:
		Input.set_custom_mouse_cursor(get_parent().get_parent().get_node("mouse/normal").texture)

func _on_use_mouse_exited():
	if current_action != null:
		Input.set_custom_mouse_cursor(get_parent().get_parent().get_node("mouse/"+current_action).texture)
	else:
		Input.set_custom_mouse_cursor(get_parent().get_parent().get_node("mouse/normal").texture)

func _on_talk_mouse_exited():
	if current_action != null:
		Input.set_custom_mouse_cursor(get_parent().get_parent().get_node("mouse/"+current_action).texture)
	else:
		Input.set_custom_mouse_cursor(get_parent().get_parent().get_node("mouse/normal").texture)


func _ready():
	vm = get_node("/root/vm")

	var acts = get_node("actions")
	for i in range(acts.get_child_count()):
		var c = acts.get_child(i)
		if !(c is BaseButton):
			continue

		c.connect("pressed", self, "action_changed", [c.get_name()])
		act_buttons.push_back(c)
