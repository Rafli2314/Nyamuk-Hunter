extends Area2D

signal squashed

@export var speed := 200

var direction := Vector2.ZERO


func _ready():
	randomize()
	$buzz.play()
	direction = Vector2(
		randf_range(-1.0, 1.0),
		randf_range(-1.0, 1.0),
	).normalized()
	input_event.connect(_on_input_event)
	
func _process(delta):
	position += direction * speed * delta
	
	var screen_size = get_viewport_rect().size
	
	if position.x <= 0 or position.x >= screen_size.x:
		direction.x *= -1
	
	if position.y <= 0 or position.x >= screen_size.y:
		direction.y *= -1

func _on_input_event(viewport, event, shape_idx):
	$slap.play()
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				squashed.emit()
				queue_free()
