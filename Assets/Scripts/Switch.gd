extends Area2D

#button variables
@export var target_object : Node #object button is attached to
@export var is_pressed = false
var button_initial_status


#called at start of scene
func _ready():
	button_initial_status = is_pressed
	initial_setup()


#sets the correct appearance for the button
func initial_setup():
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
	$CollisionShape2D.set_deferred("disabled", true)
	await get_tree().create_timer(0.5).timeout #delay on button being pressed
	$CollisionShape2D.set_deferred("disabled", false)


func restart():
	is_pressed = button_initial_status
	initial_setup()
