extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)
	animation_player.play("enter")
func _on_area_2d_body_entered(body: Node2D) -> void:
	if Dialogic.current_timeline != null:
		return
	Dialogic.start('scene2_timeline')
	get_viewport().set_input_as_handled()
func _on_dialogic_signal(argument:String):
	if argument == "shoot_scripta":
		animation_player.play("shoot")


func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_restart_pressed() -> void:
		get_tree().change_scene_to_file("res://Scenes/scene_1/scene_1.tscn")
