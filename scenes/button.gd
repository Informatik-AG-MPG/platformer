extends Button

func _ready():
	pressed.connect(_load_scene)
	
func _load_scene():
	if (self.name == "restart_button"):
		get_tree().change_scene_to_file("res://scenes/main.tscn")
	elif (self.name == "quit_button"):
		get_tree().quit()
