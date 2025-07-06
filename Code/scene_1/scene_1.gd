extends Node2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	animation_player.play("0")
	Dialogic.signal_event.connect(_on_dialogic_signal)
	if Dialogic.current_timeline != null:
		return
	Dialogic.start('first_gif_timeline')
	animated_sprite_2d.visible = true
	get_viewport().set_input_as_handled()
	
func _on_dialogic_signal(argument:String):
	if argument == "change_scene":
		change_scene()
	match argument:
		"Gif_1":
			animation_player.play("1")
		"Gif_2":
			animation_player.play("2")
		"Gif_3":
			animation_player.play("3")
		"Gif_4":
			animation_player.play("4")
		"Gif_5":
			animation_player.play("5")
		"Gif_6":
			animation_player.play("6")
		"Gif_7":
			animation_player.play("7")
		"Gif_8":
			animation_player.play("8")

func change_scene():
	get_tree().change_scene_to_file("res://Scenes/Scene_2/scene_2.tscn")
