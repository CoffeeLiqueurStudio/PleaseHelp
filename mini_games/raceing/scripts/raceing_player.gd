extends CharacterBody2D

const SPEED = 200.0
const AUTO_SPEED = -100.0  # движение вверх

func _physics_process(delta):
	var direction = Vector2.ZERO

	# Влево/вправо по вводу
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1

	# Постоянное движение вверх (отрицательная ось Y)
	velocity = Vector2(direction.x * SPEED, AUTO_SPEED)
	move_and_slide()
