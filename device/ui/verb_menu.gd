extends Control

var vm

var act_buttons = []

var current_action

#Input.set_custom_mouse_cursor(get_node(mouse_image).texture)

func reset_mouse(p_current_action):
	Input.set_custom_mouse_cursor(get_parent().get_parent().get_node("mouse/normal").texture)
	for b in act_buttons:
		b.set_pressed(false)
	printt("reset mouse function")

func set_action_name(action):
	current_action = action

func action_changed(action):
	get_tree().call_group("game", "set_current_action", action)
	printt("After setting...")

	#If just clicking Button and then item it doesn't get to the print statement
	for b in act_buttons:
		b.set_pressed(b.get_name() == action)
		printt("Inside b",b.name)
	
	Input.set_custom_mouse_cursor(get_parent().get_parent().get_node("mouse/"+action).texture)
	set_action_name(action)
	printt("End of action changed")
	#reset_action()

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

func _process(_delta):
	if current_action == null or current_action == "":
		Input.set_custom_mouse_cursor(get_parent().get_parent().get_node("mouse/normal").texture)
	#else:
	#	Input.set_custom_mouse_cursor(get_parent().get_parent().get_node("mouse/"+current_action).texture)

func _ready():
	vm = get_node("/root/vm")
	
	add_to_group("verb_menu")
	
	var acts = get_node("actions")
	for i in range(acts.get_child_count()):
		var c = acts.get_child(i)
		printt("this is c",c.name)
		if !(c is BaseButton):
			continue
		c.connect("pressed", self, "action_changed", [c.get_name()])
		#c.disconnect()
		printt("After pressed")
		act_buttons.push_back(c)
		printt("push_back",c,act_buttons[0])
