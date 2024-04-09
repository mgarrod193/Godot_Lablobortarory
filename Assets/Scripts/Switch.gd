extends Area2D

#button variables
@export var target_object : Node #object button is attached to
@export var is_pressed = false


#checks starting status of button and displays apporopriate appearance
func _ready():
	if is_pressed:
		$ButtonPressed.show()
		$ButtonNotPressed.hide()
	else:
		$ButtonPressed.hide()
		$ButtonNotPressed.show()


#checks if player/box entered button area and if so pushes the button
func _on_body_entered(body):
	if body.name == "Player" or "Box":
		target_object.switch()
	
	#switches button status and changes appearance 
	if is_pressed:
		is_pressed = false
		$ButtonPressed.hide()
		$ButtonNotPressed.show()
	else:
		$ButtonPressed.show()
		$ButtonNotPressed.hide()
		is_pressed = true



		
