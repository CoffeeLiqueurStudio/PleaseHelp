extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var chosed_area: String = ""
@onready var label: Label = $player/Label2


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	label.hide()
func _on_bedroom_exit_area_2d_body_entered(body: Node2D) -> void:
	chosed_area = "exit_bedroom"
	label.show()
func _on_to_bedroom_door_area_2d_body_entered(body: Node2D) -> void:
	print("enter_bedroom")
	chosed_area = "enter_bedroom"
	label.show()
func _on_to_kitchen_door_area_2d_body_entered(body: Node2D) -> void:
	print("enter_kitchen")
	chosed_area = "enter_kitchen"
	label.show()
func _on_kitchen_exit_area_body_entered(body: Node2D) -> void:
	chosed_area = "exit_kitchen"
	label.show()
func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_end"):
		animation_player.play("end")
	if Input.is_action_just_pressed("interact"):
		match chosed_area:
			"exit_bedroom":
				animation_player.play("bedroom_exit")
				await animation_player.animation_finished
				animation_player.play("corridor_enter")
			"enter_bedroom":
				animation_player.play("corridor_exit")
				await animation_player.animation_finished
				animation_player.play("bedroom_enter")
			"exit_kitchen":
				animation_player.play("kitchen_exit")
				await animation_player.animation_finished
				animation_player.play("corridor_enter")
			"enter_kitchen":
				animation_player.play("corridor_exit")
				await animation_player.animation_finished
				animation_player.play("kitchen_enter")
			"corridor_bedroom":
				pass
			"corridor_bedroom":
				pass


func _on_kitchen_exit_area_body_exited(body: Node2D) -> void:
	chosed_area = ""
	label.hide()
func _on_bedroom_exit_area_2d_body_exited(body: Node2D) -> void:
	chosed_area = ""
	label.hide()
func _on_to_kitchen_door_area_2d_body_exited(body: Node2D) -> void:
	chosed_area = ""
	label.hide()
func _on_to_bedroom_door_area_2d_body_exited(body: Node2D) -> void:
	chosed_area = ""
	label.hide()
