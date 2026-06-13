extends Area2D

@export var speed := 100

var direction := Vector2.ZERO

func _ready():
	randomize()
	
	direction = Vector2(
		randf_range(-1.0, 1.0),
		randf_range(-1.0, 1.0),
	).normalized()
	input_event.connect(_on_input_event)
	
func _process(delta):
	position += direction * speed * delta

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				queue_free()
