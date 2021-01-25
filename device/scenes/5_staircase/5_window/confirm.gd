extends TextureButton

var current_scene
var vm

func _ready():
	current_scene = get_node("dummy").get_parent().get_parent()
	vm = get_node("/root/vm")


func check_positions():
	if (
	get_parent().get_parent().get_node("top_left").get_position() == Vector2(621,240) \
	&& get_parent().get_parent().get_node("top_middle").get_position() == Vector2(810.5,240) \
	&& get_parent().get_parent().get_node("top_right").get_position() == Vector2(1000,240) \
	&& get_parent().get_parent().get_node("middle_left").get_position() == Vector2(621,556.5) \
	&& get_parent().get_parent().get_node("middle_middle").get_position() == Vector2(810.5,556.5) \
	&& get_parent().get_parent().get_node("middle_right").get_position() == Vector2(1000,556.5) \
	&& get_parent().get_parent().get_node("bottom_left").get_position() == Vector2(621,873) \
	&& get_parent().get_parent().get_node("bottom_middle").get_position() == Vector2(810.5,873) \
	&& get_parent().get_parent().get_node("bottom_right").get_position() == Vector2(1000,873) \
	):
		vm.set_global("staircase_window_solved",true)
	else: 
		vm.set_global("staircase_window_solved",false)
	

func _on_confirm_pressed():
	check_positions()
	current_scene.activate("load", null)
