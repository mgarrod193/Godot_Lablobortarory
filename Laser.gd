extends RayCast2D

#laser variables
var collide_point
var target = get_target_position()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#Sets the length of the line based on collide point
func _process(delta):
	$Line2D.set_point_position(1, collide_point) # To set a point position
	
	#checks if colliding and kills target if collider is player
	if is_colliding():
		if get_collider().name == "Player":
			get_collider().die()


#gets the collide point coordinates if it exists else returns target position coords
func _physics_process(delta):
	if is_colliding():
		collide_point = to_local(get_collision_point())
	else:
		collide_point = get_target_position()


#Switches between off and on state of laster and toggles visibiliy as necessary
func switch():
	if is_enabled():
		set_enabled(false)
		$Line2D.visible = false
	else:
		set_enabled(true)
		$Line2D.visible = true
	
