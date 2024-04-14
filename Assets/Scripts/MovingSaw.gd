extends Sprite2D



var startpoint
var endpoint

var move_up = true
@export var speed = Vector2(0,1)
@export var turn_speed = PI*50

func _ready():
	startpoint = $saw/startpoint.position
	endpoint = $saw/endpoint.position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if move_up:
		$saw.position -= speed * delta
	else:
		$saw.position += speed * delta
	if $saw.position <= startpoint:
		move_up = false
	elif $saw.position >= endpoint:
		move_up = true
	$saw.rotation -= turn_speed * delta/2


func _on_saw_body_entered(body):
	if body.name == "Player":
		body.die()
