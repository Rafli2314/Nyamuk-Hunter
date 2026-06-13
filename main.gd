extends Node2D

var score := 0

func add_score():
	score += 1
	
	$CanvasLayer/ScoreLabel.text = "score : %d" % score
