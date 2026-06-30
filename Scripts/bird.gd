extends CharacterBody3D



const JUMP_VELOCITY = 8


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		rotate_x(deg_to_rad(velocity.y * 0.2))
		velocity += get_gravity() * delta * 3

	if Input.is_action_just_pressed("flap"):
		rotation.x = rotate_toward(rotation.x,deg_to_rad(60),deg_to_rad(50 * delta))
		velocity.y = JUMP_VELOCITY
		

	move_and_slide()
