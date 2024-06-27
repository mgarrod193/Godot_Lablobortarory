extends RayCast2D

#laser variables
var initial_status
var line_initial_status
var collide_point
var target = get_target_position()

var point_light


func _ready():
	initial_status = is_enabled()
	line_initial_status = $Line2D.visible
	point_light =  $PointLight2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
#Sets the length of the line based on collide point
func _process(_delta):
	$Line2D.set_point_position(1, collide_point) # To set a point position
	
	#checks if colliding and kills target if collider is player
	if is_colliding():
		if get_collider().name == "Player":
			get_collider().die()


#gets the collide point coordinates if it exists else returns target position coords
func _physics_process(delta):
	if is_colliding():
		collide_point = to_local(get_collision_point())
	#	point_light.set_transform(to_vector2(collide_point))
	else:
		collide_point = get_target_position()
	#	point_light.set_transform(to_vector2(collide_point))

#Switches between off and on state of laster and toggles visibiliy as necessary
func switch():
	if is_enabled():
		set_enabled(false)
		$Line2D.visible = false
	else:
		set_enabled(true)
		$Line2D.visible = true


#called when game restarted to set back to original shape
func restart():
	set_enabled(initial_status)
	$Line2D.visible = line_initial_status
