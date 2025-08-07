extends CharacterBody2D

const SPEED = 150.0

func _physics_process(delta):
	velocity = Vector2(0, SPEED)
	move_and_slide()

	# Удалить, если вышел за пределы экрана
	if global_position.y > get_viewport_rect().size.y + 100:
		queue_free()
