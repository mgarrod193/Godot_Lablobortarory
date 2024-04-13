extends Area2D




func _on_body_entered(body):
	if body.name == "Player":
		$CollisionShape2D.set_deferred("disabled", true)
		body.collect()
		hide()



func restart():
	$CollisionShape2D.set_deferred("disabled", false)
	show()
