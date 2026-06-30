extends CharacterBody3D

@onready var animation: AnimationPlayer = $AnimationPlayer


const JUMP_VELOCITY = 8
var paused = false


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		rotate_x(deg_to_rad(velocity.y * 0.2))
		if velocity.y < 0:
			animation.stop()
		else:
			animation.play("flying")
		velocity += get_gravity() * delta * 3

	if Input.is_action_just_pressed("flap"):

		rotation.x = rotate_toward(rotation.x,deg_to_rad(-60),deg_to_rad(50 * delta))
		rotation.x = clampf(rotation.x,deg_to_rad(-90),deg_to_rad(45))
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("esc") and !paused:
		Engine.time_scale = 0.0
		paused = true
	elif Input.is_action_just_pressed("esc") and paused:
		Engine.time_scale = 1.0
		paused = false
		
		

	move_and_slide()
