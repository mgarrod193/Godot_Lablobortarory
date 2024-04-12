extends Area2D




func _on_body_entered(body):
	if body.name == "Player":
		$CollisionShape2D.set_deferred("disabled", true)
		body.collect()
		queue_free()
