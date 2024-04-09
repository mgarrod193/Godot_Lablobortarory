extends Area2D

@export var target_object : Node
@export var is_pressed = false

func _ready():
	if is_pressed:
		$ButtonPressed.show()
		$ButtonNotPressed.hide()
	else:
		$ButtonPressed.hide()
		$ButtonNotPressed.show()


func _on_body_entered(body):
	if body.name == "Player" or "Box":
		press_button()
		target_object.switch()

func press_button():
	if is_pressed:
		is_pressed = false
		$ButtonPressed.hide()
		$ButtonNotPressed.show()
	else:
		$ButtonPressed.show()
		$ButtonNotPressed.hide()
		is_pressed = true
		
