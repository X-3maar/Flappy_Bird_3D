extends CharacterBody3D
@onready var bird: CharacterBody3D = $"."

@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var paused: Node2D = $"../CanvasLayer/Paused"
@onready var lost: Node2D = $"../CanvasLayer/Lost"
@onready var score: Label = $"../CanvasLayer/Score"
@onready var label_2: Label = $"../CanvasLayer/Label2"
@onready var label_3: Label = $"../CanvasLayer/Label3"
@onready var best: Label = $"../CanvasLayer/Best"
var pov = true
@onready var camera_3d: Camera3D = $"../Camera3D"
const JUMP_VELOCITY = 8
var pause = false
var dead = false

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("tab") and pov:
		pov = false
	elif Input.is_action_just_pressed("tab") and !pov:
		pov = true
	if pov == true:
		camera_3d.global_position = Vector3(5.08,0,0)
		camera_3d.global_rotation = Vector3(0,deg_to_rad(90),0)
		camera_3d.call_deferred("reparent",get_tree().current_scene)
	elif pov == false:
		camera_3d.call_deferred("reparent",bird)
		camera_3d.global_position = bird.global_position - Vector3(0,0,1)
		camera_3d.global_rotation = bird.global_rotation
		
		
	if dead:
		lost.show()
		score.hide()
		label_2.hide()
		label_3.hide()
		best.hide()
		
	if not is_on_floor():
		
		rotate_x(deg_to_rad(velocity.y * 0.2))

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
	elif dead:
		if Input.is_action_just_pressed("ui_accept"):
			dead = false
			Engine.time_scale = 1.0
			get_tree().reload_current_scene()

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
	Global.scoree = 0
	Engine.time_scale = 1.0
	score.show()
	label_2.show()
	label_3.show()
	best.show()
	get_tree().reload_current_scene()
