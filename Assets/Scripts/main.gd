extends Node

var game_over : bool #game status variable
var score : int #Player's score

@export var Collectable_scene : PackedScene
var collectables

# Called when the node enters the scene tree for the first time.
func _ready():
	game_over = false
	$Player.position = $StartingPosition.position #sets player position
	score = 0
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if game_over:
		$Hud.show()

#Triggers game over
func _on_player_killed():
	game_over = true
	$GUI.hide()

#Triggers game resatart
func _on_restart():
	game_over = false
	score = 0
	$Player.restart()
	get_tree().call_group("Lasers", "restart")
	get_tree().call_group("switches", "restart")
	$Collectables.get_tree().call_group("Collectable", "restart")
	$GUI.show()
	$GUI.update_score(score)
	$Hud.hide()


func _on_player_collected():
	score += 1
	$GUI.update_score(score)
