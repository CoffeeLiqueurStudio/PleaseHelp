extends Node2D

@onready var full_screen_check_box: CheckBox = $CanvasLayer/VBoxContainer2/fullscreenCheckBox
@onready var resolution_option_button: OptionButton = $CanvasLayer/VBoxContainer2/resolutionOptionButton

const BASE_RESOLUTION: Vector2 = Vector2(1920, 1080)

var Resolutions: Dictionary = {
	"3840x2160": Vector2i(3840, 2160),
	"2560x1440": Vector2i(2560, 1440),
	"1920x1080": Vector2i(1920, 1080),
	"1366x768": Vector2i(1366, 768),
	"1536x864": Vector2i(1536, 864),
	"1280x720": Vector2i(1280, 720),
	"1440x900": Vector2i(1440, 900),
	"1600x900": Vector2i(1600, 900),
	"1024x600": Vector2i(1024, 600),
	"800x600": Vector2i(800, 600)
}

func _ready() -> void:
	Add_Resolutions()
	Check_Variables()

func update_stretch_canvas():
	var current_size = get_window().get_size()
	var root = get_tree().root
	
func Add_Resolutions():
	var current_resolution = get_window().get_size()
	var id = 0
	for res_str in Resolutions:
		resolution_option_button.add_item(res_str, id)
		if Resolutions[res_str] == current_resolution:
			resolution_option_button.select(id)
		id += 1

func Check_Variables():
	var mode = get_window().get_mode()
	if mode == Window.MODE_FULLSCREEN:
		resolution_option_button.set_disabled(true)
		full_screen_check_box.set_pressed_no_signal(true)

func Set_Resolution_Text():
	var size = get_window().get_size()
	var text = "%sx%s" % [size.x, size.y]
	resolution_option_button.set_text(text)

func _on_resolution_option_button_item_selected(index: int) -> void:
	var id = resolution_option_button.get_item_text(index)
	var desired_size = Resolutions[id]

	# Автоматическая корректировка под размер экрана
	var safe_size = clamp_to_screen_usable_size(desired_size)

	get_window().set_mode(Window.MODE_WINDOWED)
	get_window().set_size(safe_size)
	update_stretch_canvas()
	Centre_Window()
	Set_Resolution_Text()

func _on_fullscreen_check_box_toggled(toggled_on: bool) -> void:
	resolution_option_button.set_disabled(toggled_on)
	if toggled_on:
		get_window().set_mode(Window.MODE_FULLSCREEN)
	else:
		get_window().set_mode(Window.MODE_WINDOWED)
		Centre_Window()
	get_tree().create_timer(0.05).timeout.connect(Set_Resolution_Text)

func Centre_Window():
	var center = DisplayServer.screen_get_position() + DisplayServer.screen_get_size() / 2
	var window_size = get_window().get_size_with_decorations()
	get_window().set_position(center - window_size / 2)

# 👇 Вот та самая функция из решения №2
func clamp_to_screen_usable_size(target: Vector2i) -> Vector2i:
	var usable_rect := DisplayServer.screen_get_usable_rect()
	var max_size := usable_rect.size
	var decorations := get_window().get_size_with_decorations() - get_window().get_size()
	var adjusted_size := target
	adjusted_size.x = min(target.x, max_size.x - decorations.x)
	adjusted_size.y = min(target.y, max_size.y - decorations.y)
	return adjusted_size

func _on_scene_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/scene_1/scene_1.tscn")
	

func _on_scene_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/scene_2/scene_2.tscn")


func _on_scene_3_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/scene_3/scene_3.tscn")
