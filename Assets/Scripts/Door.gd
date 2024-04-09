extends Area2D

@export var opened : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	if opened:
		open()
	else:
		close()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func switch():
	if opened:
		close()
	else:
		open()

func open():
	opened = true
	$AnimatedSprite2D.play("open")


func close():
	opened = false
	$AnimatedSprite2D.play("close")
	
