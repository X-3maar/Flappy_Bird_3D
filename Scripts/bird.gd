extends CharacterBody3D

@onready var animation: AnimationPlayer = $AnimationPlayer

@onready var paused: Node2D = $"../CanvasLayer/Paused"
@onready var lost: Node2D = $"../CanvasLayer/Lost"

const JUMP_VELOCITY = 8
var pause = false
var dead = false

func _physics_process(delta: float) -> void:
	if dead:
		lost.show()
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
	if !dead:
		if Input.is_action_just_pressed("esc") and !pause:
			Engine.time_scale = 0.0
			paused.show()
			pause = true
		elif Input.is_action_just_pressed("esc") and pause:
			Engine.time_scale = 1.0
			paused.hide()
			pause = false

	move_and_slide()


func _on_y_pressed() -> void:
	Engine.time_scale = 1.0
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")


func _on_n_pressed() -> void:
	paused.hide()
	Engine.time_scale = 1.0
	pause = false


func _on_replay_pressed() -> void:
	dead = false
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
