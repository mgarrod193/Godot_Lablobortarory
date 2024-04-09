extends Node



var game_over : bool
# Called when the node enters the scene tree for the first time.
func _ready():
	game_over = false
	$Player.position = $StartingPosition.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if game_over:
		$Hud.show()


func _on_player_killed():
	print("player killed")
	game_over = true


func _on_restart():
	game_over
	$Player.position = $StartingPosition.position
	$Player.show()
