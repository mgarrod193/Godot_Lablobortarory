extends RayCast2D


var collide_point
var target = get_target_position()


# Called when the node enters the scene tree for the first time.
func _ready():
	print(is_enabled())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Line2D.set_point_position(1, collide_point) # To set a point position
	if is_colliding():
		if get_collider().name == "Player":
			get_collider().die()
	

func _physics_process(delta):
	if is_colliding():
		collide_point = to_local(get_collision_point())
	else:
		collide_point = get_target_position()

func switch():
	if is_enabled():
		set_enabled(false)
		$Line2D.visible = false
	else:
		set_enabled(true)
		$Line2D.visible = true
	
