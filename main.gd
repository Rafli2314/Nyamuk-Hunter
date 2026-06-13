extends Node2D

var score := 0
var mosquito_speed_bonus = 0

		
func add_score():
	score += 1
	$CanvasLayer/ScoreLabel.text = "score : %d" % score
	if score >= 10:
		$CanvasLayer/ScoreLabel.text = "YOU WIN!!!"
	if score % 5 == 0:
		mosquito_speed_bonus += 20
	

func _process(delta):
	var count = get_tree().get_nodes_in_group("mosquitos").size()
	
	if count >= 50:
		game_over()
		
func game_over():
	print("game over")
	$CanvasLayer/ScoreLabel.text = "game over"
