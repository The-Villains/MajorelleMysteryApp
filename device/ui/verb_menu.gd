extends Control

var vm

var act_buttons = []

var current_action

func set_mouse(p_current_action):
	if p_current_action == "look":
		Input.set_custom_mouse_cursor((get_parent().get_parent().get_node("mouse/look").texture),0,Vector2(20,14))
	elif p_current_action == "talk":
		Input.set_custom_mouse_cursor((get_parent().get_parent().get_node("mouse/talk").texture),0,Vector2(24,15))
	elif p_current_action == "use":
		Input.set_custom_mouse_cursor((get_parent().get_parent().get_node("mouse/use").texture),0,Vector2(10,14))
	elif p_current_action == "normal":
		Input.set_custom_mouse_cursor((get_parent().get_parent().get_node("mouse/normal").texture),0,Vector2(16,9))
	elif p_current_action == null or "":
		Input.set_custom_mouse_cursor((get_parent().get_parent().get_node("mouse/normal").texture),0,Vector2(16,9))

func reset_mouse(_p_current_action):
	set_mouse("normal")
	for b in act_buttons:
		b.set_pressed(false)
	printt("reset mouse function")

func something_picked():
	Input.set_custom_mouse_cursor(get_parent().get_parent().get_node("mouse/use2").texture,0,Vector2(9,30))

func reset_picked():
	Input.set_custom_mouse_cursor(get_parent().get_parent().get_node("mouse/use").texture,0,Vector2(10,14))

func set_action_name(action):
	current_action = action

func action_changed(action):
	get_tree().call_group("game", "set_current_action", action)
	printt("After setting...")

	#If just clicking Button and then item it doesn't get to the print statement
	for b in act_buttons:
		b.set_pressed(b.get_name() == action)
		printt("Inside b",b.name)
	
	set_mouse(action)
	set_action_name(action)
	printt("End of action changed")
	#reset_action()

# Modified behaviour when entering the verb_menu area aka the look, use and talk buttons to show the default or normal mouse cursor
# Entering that area sets the cursor to "Normal" and Exiting the area sets it back to the current selected action if one is active, else the cursor remains normal

func _on_look_mouse_entered():
	set_mouse("normal")

func _on_use_mouse_entered():
	set_mouse("normal")

func _on_talk_mouse_entered():
	set_mouse("normal")

func _on_look_mouse_exited():
	if current_action != null:
		set_mouse(current_action)
	else:
		set_mouse("normal")

func _on_use_mouse_exited():
	if current_action != null:
		set_mouse(current_action)
	else:
		set_mouse("normal")

func _on_talk_mouse_exited():
	if current_action != null:
		set_mouse(current_action)
	else:
		set_mouse("normal")

#func _process(_delta):
#	if current_action == null or current_action == "":
#		Input.set_custom_mouse_cursor((get_parent().get_parent().get_node("mouse/normal").texture),0,Vector2(16,9))
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
