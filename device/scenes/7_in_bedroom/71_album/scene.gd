extends "res://globals/scene_base.gd"

var vm;
var aNumber = 0
var bNumber = 0
var cNumber = 0
var dNumber = 0


func _on_aSelect_value_changed(value):
	aNumber = value


func _on_bSelect_value_changed(value):
	bNumber = value


func _on_c1Select_value_changed(value):
	cNumber = value


func _on_d1Select_value_changed(value):
	dNumber = value


func _ready():
	get_node("/root/main").call_deferred("set_current_scene", self)
	vm = get_tree().get_root().get_node("vm")	
	get_node("book_with_lock/a1Select").set("value", aNumber)
	get_node("book_with_lock/b1Select").set("value", bNumber)
	get_node("book_with_lock/c1Select").set("value", cNumber)
	get_node("book_with_lock/d1Select").set("value", dNumber)
