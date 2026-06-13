extends Node

@export var mosquito_scene : PackedScene

func _ready():
	spawn_mosquito()
	
	$Timer.timeout.connect(spawn_mosquito)
	
func spawn_mosquito():
	var mosquito = mosquito_scene.instantiate()
	
	mosquito.position = Vector2(
		randf_range (50, 750),
		randf_range (50, 550)
	) 
	mosquito.squashed.connect(
		get_parent().add_score
	)
	get_parent().add_child(mosquito)
