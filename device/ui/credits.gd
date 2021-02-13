extends Node2D

var vm
var lang

func close():
	get_node("/root/main").menu_close(self)
	queue_free()

func menu_collapsed():
	close()

func input(event):
	if event.is_action("menu_request") && event.is_pressed() && !event.is_echo():
		close()

func back_pressed():
	get_node("/root/main").load_menu(ProjectSettings.get("ui/main_menu"))
	
func set_credit_lang():
	lang = vm.settings.text_lang
	#printt("set lang",lang)

func set_credit_text():
	#printt("set text", lang)
	if lang == "de":
		get_node("Credits_DE").show()
		get_node("Credits_EN").hide()
		get_node("Credits_FR").hide()
	elif lang == "fr":
		get_node("Credits_FR").show()
		get_node("Credits_EN").hide()
		get_node("Credits_DE").hide()
	else:
		get_node("Credits_EN").show()
		get_node("Credits_DE").hide()
		get_node("Credits_FR").hide()	

func _ready():
	
	printt("loading new")
	
	get_node("/root/main").menu_open(self)

	vm = get_tree().get_root().get_node("vm")
	
	set_credit_lang()
	set_credit_text()
	# warning-ignore:return_value_discarded
	get_node("back").connect("pressed", self, "back_pressed")
