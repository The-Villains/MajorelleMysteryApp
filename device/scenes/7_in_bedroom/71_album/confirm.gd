extends TextureButton

var current_scene
var vm

func _ready():
	current_scene = get_node("dummy").get_parent().get_parent()
	vm = get_node("/root/vm")


func check_values():
	if (
	get_parent().get_parent().get_node("book_with_lock/a1Select").get("value") == 1 \
	&& get_parent().get_parent().get_node("book_with_lock/b1Select").get("value") == 9 \
	&& get_parent().get_parent().get_node("book_with_lock/c1Select").get("value") == 0 \
	&& get_parent().get_parent().get_node("book_with_lock/d1Select").get("value") == 2 \
	):
		vm.set_global("lock_open",true)
		#printt("Open")
	else: 
		vm.set_global("lock_open",false)
		#printt("Closed")
	

func _on_confirm_pressed():
	check_values()
	current_scene.activate("load", null)
