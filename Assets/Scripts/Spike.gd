extends Area2D


#kills player if player collides with collision shape
func _on_body_entered(body):
	if body.name == "Player":
		body.die()
