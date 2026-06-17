extends Node2D

# script to center the UI elements in the end screen

func _ready():
	# variables for all the UI elements
	var text: Label = $text
	var button_1 = $restart_button
	var button_2: Button = $quit_button
	
	# get screen size
	var screen_size = DisplayServer.window_get_size()
	
	# align UI elements
	# note that 32, 2 and 1.5 are just values that I think look alright.
	text.position = Vector2((screen_size.x/2 - text.size.x/2), screen_size.y/32)
	button_1.position = Vector2((screen_size.x/2 - button_1.size.x/2), screen_size.y/2)
	button_2.position = Vector2((screen_size.x/2 - button_2.size.x/2), screen_size.y/1.5)
