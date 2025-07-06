extends Node
class_name DialogicTextEffectShake

# Обязательно
@export var dialogic_text_effect := true
var bbcode := "shake"
@export var frequency := 25.0
@export var amplitude := 4.0
func _process_custom_effect(character_data: Dictionary, character_index: int, elapsed_time: float) -> Dictionary:
	# character_data содержит позицию, цвет и пр.

	# создаём небольшое случайное смещение по Y
	var offset_y := sin(elapsed_time * frequency + character_index) * amplitude

	# применим смещение к позиции
	character_data.position.y += offset_y

	return character_data
