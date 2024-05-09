extends Node2D

#This just makes the placeholders dissapear when running the game.
#Thats it.

func _ready():
	# Check if the game is running in the editor
	if Engine.is_editor_hint():
		# Node is visible in the editor
		pass
	else:
		# Node disappears when running the game
		hide()  # Or use $NodeToDisappear.visible = false if you want to disable visibility
