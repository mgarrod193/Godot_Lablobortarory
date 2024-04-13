extends Node

var score

func update_score(score: int):
	$ScoreLabel.text = str(score)
