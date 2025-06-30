extends CharacterBody2D
@onready var label: Label = $Label
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var speed: float = 160.0
enum States {IDLE, RUN}
var state: States = States.IDLE
var playerdirection: String = "down"
func _physics_process(delta: float) -> void:
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_dir * speed
	
	if input_dir == Vector2(1,0):
		playerdirection = "right"
	elif input_dir == Vector2(-1,0):
		playerdirection = "left"
		
	if input_dir == Vector2(0,-1):
		playerdirection = "up"
	elif input_dir == Vector2(0,1):
		playerdirection = "down"
		

	if velocity == Vector2.ZERO:
		state = States.IDLE
	elif velocity != Vector2.ZERO:
		state = States.RUN
	switch_state()
	move_and_slide()
func switch_state():
	if state == States.IDLE:
		animated_sprite_2d.play(str(playerdirection)+"_idle")
	if state == States.RUN:
		animated_sprite_2d.play(str(playerdirection)+"_walk")
