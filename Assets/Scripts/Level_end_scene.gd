extends CanvasLayer

@export var next_level : PackedScene

var score
var max_score

func print_score(x):
	$HBoxContainer.find_child("TotalScore").text = "Your Score: " + str(x) + "/" + str(max_score)

func calculate_level_score(score):
	for i in range(score+1):
		print_score(i)
		await get_tree().create_timer(0.02).timeout


func _on_next_level_button_pressed():
	get_tree().change_scene_to_packed(next_level)
