extends Area2D

@export var opened : bool #Initial door state


# Called when the node enters the scene tree for the first time.
# Check stating state of door and displays apporiate visual
func _ready():
	if opened:
		open()
	else:
		close()


#Called when linked button is pressed and changes door state
func switch():
	if opened:
		close()
	else:
		open()


#sets door to open and displays animation
func open():
	opened = true
	$AnimatedSprite2D.play("open")


#sets door to closed and displays animation
func close():
	opened = false
	$AnimatedSprite2D.play("close")
	