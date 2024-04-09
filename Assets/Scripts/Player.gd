extends CharacterBody2D

signal killed #signal for when player is killed

#player vairables
var can_move = true
var starting_position : Vector2
const SPEED = 125.0
const JUMP_VELOCITY = -450.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

#force used to push blocks
var push_force : float = 5


#Slight delays when scene loads to get correct starting position marker
func _ready():
	await get_tree().create_timer(0.1).timeout
	starting_position = position


#Checks if player can move and adjusts velocity based on movement input
func _physics_process(delta):
	if can_move:
		# Add the gravity.
		if not is_on_floor():
			velocity.y += gravity * delta
	
		# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
	
		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction = Input.get_axis("move_left", "move_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, 12)

	move_and_slide()

	# checks for collision with a rigidbody and adds a psuhing force to it
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			c.get_collider().apply_central_impulse(-c.get_normal() * push_force)


#Called when player is killed, removes collision, velcoity and visibibility
#stops player input and sends out killed signal
func die():
	$CollisionShape2D.set_deferred("disabled", true)
	velocity = Vector2.ZERO
	hide()
	can_move = false
	killed.emit()


#called when restart is pressed. resets position to last starting_position
#turns collision on, shows character and allows movment
func collision_on():
	position = starting_position
	$CollisionShape2D.set_deferred("disabled", false)
	show()
	can_move = true
