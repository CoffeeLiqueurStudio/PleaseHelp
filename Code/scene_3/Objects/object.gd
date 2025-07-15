extends CharacterBody2D

var button_pressed: bool = false
var schosed_area: String = ""
@onready var label_2: Label = $"../../../player/Label2"
@onready var player: CharacterBody2D = $"../../../player"


func _physics_process(delta: float) -> void:
	print(schosed_area)
func _on_bed_body_entered(body: Node2D) -> void:
	schosed_area = 'bed'
	label_2.show()
func _on_closet_body_entered(body: Node2D) -> void:
	schosed_area = 'closet'
	label_2.show()
func _on_nightstand_body_entered(body: Node2D) -> void:
	schosed_area = 'nightstable'
	label_2.show()
func _on_tabel_body_entered(body: Node2D) -> void:
	schosed_area = 'table'
	label_2.show()
func _ready() -> void:
	label_2.hide()

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		match schosed_area:
			"table":
				Dialogic.start('table_timeline')
				get_viewport().set_input_as_handled()
			"nightstable":
				Dialogic.start('nightstable_timeline')
				get_viewport().set_input_as_handled()
			"closet":
				Dialogic.start("closet_timeline")
				get_viewport().set_input_as_handled()
			"bed":
				Dialogic.start('bed_timeline')
				get_viewport().set_input_as_handled()



func _on_bed_body_exited(body: Node2D) -> void:
	if schosed_area == "bed":
		schosed_area = ''
		label_2.hide()
func _on_closet_body_exited(body: Node2D) -> void:
	if schosed_area == "closet":
		schosed_area = ''
		label_2.hide()
func _on_nightstand_body_exited(body: Node2D) -> void:
	if schosed_area == "nightstable":
		schosed_area = ''
		label_2.hide()
func _on_tabel_body_exited(body: Node2D) -> void:
	if schosed_area == "table":
		schosed_area = ''
		label_2.hide()
