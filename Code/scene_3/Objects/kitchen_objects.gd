extends CharacterBody2D

var schosed_area: String = ""
@onready var label: Label = $"../../../CanvasLayer/Label"

func _ready() -> void:
	label.hide()
func _on_fridge_area_body_entered(body: Node2D) -> void:
	schosed_area = 'fridge'
	label.show()
func _on_countertop_area_body_entered(body: Node2D) -> void:
	schosed_area = 'countertop'
	label.show()
func _on_countertop_area_2_body_entered(body: Node2D) -> void:
	schosed_area = 'countertop2'
	label.show()
func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		match schosed_area:
			"fridge":
				#if Dialogic.current_timeline != null:
					#Dialogic.current_timeline = null
				Dialogic.start('fridge_timeline')
				get_viewport().set_input_as_handled()
				schosed_area = ''
			"countertop":
				#if Dialogic.current_timeline != null:
					#Dialogic.current_timeline = null
				Dialogic.start('countertop1_timeline')
				get_viewport().set_input_as_handled()
				schosed_area = ''
			"countertop2":
				#if Dialogic.current_timeline != null:
					#Dialogic.current_timeline = null
				Dialogic.start("countertop2_timeline")
				get_viewport().set_input_as_handled()
				schosed_area = ''


func _on_fridge_area_body_exited(body: Node2D) -> void:
	schosed_area = ''
	label.hide()
func _on_countertop_area_body_exited(body: Node2D) -> void:
	schosed_area = ''
	label.hide()
func _on_countertop_2_area_body_exited(body: Node2D) -> void:
	schosed_area = ''
	label.hide()
