extends CharacterBody2D

var button_pressed: bool = false
var schosed_area: String = ""

func _on_bed_body_entered(body: Node2D) -> void:
	schosed_area = 'bed'
func _on_closet_body_entered(body: Node2D) -> void:
	schosed_area = 'closet'
func _on_nightstand_body_entered(body: Node2D) -> void:
	schosed_area = 'nightstable'
func _on_tabel_body_entered(body: Node2D) -> void:
	schosed_area = 'table'


func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		match schosed_area:
			"table":
				#if Dialogic.current_timeline != null:
					#Dialogic.current_timeline = null
				Dialogic.start('table_timeline')
				get_viewport().set_input_as_handled()
				schosed_area = ''
			"nightstable":
				#if Dialogic.current_timeline != null:
					#Dialogic.current_timeline = null
				Dialogic.start('nightstable_timeline')
				get_viewport().set_input_as_handled()
				schosed_area = ''
			"closet":
				#if Dialogic.current_timeline != null:
					#Dialogic.current_timeline = null
				Dialogic.start("closet_timeline")
				get_viewport().set_input_as_handled()
				schosed_area = ''
			"bed":
				#if Dialogic.current_timeline != null:
					#Dialogic.current_timeline = null
				Dialogic.start('bed_timeline')
				get_viewport().set_input_as_handled()
				schosed_area = ''
		button_pressed = true
