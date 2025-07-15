extends CharacterBody2D

var schosed_area: String = ""
@onready var label_2: Label = $"../../../player/Label2"


func _on_fridge_area_body_entered(body: Node2D) -> void:
	schosed_area = 'fridge'
	label_2.show()
func _on_countertop_area_body_entered(body: Node2D) -> void:
	schosed_area = 'countertop'
	label_2.show()
func _on_countertop_area_2_body_entered(body: Node2D) -> void:
	schosed_area = 'countertop2'
	label_2.show()
func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		match schosed_area:
			"fridge":
				Dialogic.start('fridge_timeline')
				get_viewport().set_input_as_handled()
			"countertop":
				Dialogic.start('countertop1_timeline')
				get_viewport().set_input_as_handled()
			"countertop2":
				Dialogic.start("countertop2_timeline")
				get_viewport().set_input_as_handled()
				
func _on_fridge_area_body_exited(body: Node2D) -> void:
	if schosed_area == "fridge":
		schosed_area = ''
		label_2.hide()
func _on_countertop_area_body_exited(body: Node2D) -> void:
	if schosed_area == "countertop":
		schosed_area = ''
		label_2.hide()
func _on_countertop_2_area_body_exited(body: Node2D) -> void:
	if schosed_area == "countertop2":
		schosed_area = ''
		label_2.hide()
