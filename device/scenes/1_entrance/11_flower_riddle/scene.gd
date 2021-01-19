extends "res://globals/scene_base.gd"

var vm;
var paintings = [
	"blumenraetsel_daisies.png",
	"blumenraetsel_original.png",
	"blumenraetsel_roses.png",
	"blumenraetsel_tulips.jpg",
]
var currentIndex = 0

func _ready():
	get_node("/root/main").call_deferred("set_current_scene", self)
	vm = get_tree().get_root().get_node("vm")	
	pass

func _on_left_pressed():
	currentIndex = currentIndex - 1 
	if currentIndex < 0:
		currentIndex = len(paintings) - 1
	var image_tex = load("res://scenes/1_entrance/11_flower_riddle/sprites/" + paintings[currentIndex]) 
	get_node("decorative-painting").texture = image_tex


func _on_right_pressed():
	currentIndex = currentIndex + 1 
	if currentIndex >= len(paintings):
		currentIndex = 0
	var image_tex = load("res://scenes/1_entrance/11_flower_riddle/sprites/" + paintings[currentIndex]) 
	get_node("decorative-painting").texture = image_tex


func _on_exit_pressed():
	vm.load_file("res://scenes/slide-show/exit.esc")
