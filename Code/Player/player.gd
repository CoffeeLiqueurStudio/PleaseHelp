extends CharacterBody2D
@onready var label: Label = $Label

var speed: float = 160.0
enum States {IDLE, RUN}
var state: States = States.IDLE

func _physics_process(delta: float) -> void:
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_dir * speed
	
	if velocity == Vector2.ZERO:
		state = States.IDLE
	elif velocity != Vector2.ZERO:
		state = States.RUN
	switch_state()
	move_and_slide()
func switch_state():
	if state == States.IDLE:
		label.text = "Player state: Idle"
	if state == States.RUN:
		label.text = "Player state: Run"
