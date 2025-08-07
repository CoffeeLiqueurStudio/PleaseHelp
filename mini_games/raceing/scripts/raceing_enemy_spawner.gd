extends Node2D

@export var enemy_scene: PackedScene

var spawn_points = [
	Vector2(100, -100),
	Vector2(200, -100),
	Vector2(300, -100)
]

func _ready():
	# Спавнить врагов периодически
	$Timer.start()
	
func _on_timer_timeout() -> void:
	var point = spawn_points[randi() % spawn_points.size()]
	var enemy = enemy_scene.instantiate()
	enemy.global_position = point
	add_child(enemy)
