extends Node

var game_over : bool #game status variable

# Called when the node enters the scene tree for the first time.
func _ready():
	game_over = false
	$Player.position = $StartingPosition.position #sets player position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if game_over:
		$Hud.show()

#Triggers game over
func _on_player_killed():
	game_over = true

#Triggers game resatart
func _on_restart():
	game_over = false
	$Hud.hide()
