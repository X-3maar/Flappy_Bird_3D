extends Node3D
@onready var animation_player: AnimationPlayer = $Camera3D/AnimationPlayer
@onready var canvas_layer: CanvasLayer = $CanvasLayer

@onready var bird: CharacterBody3D = $Bird

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	animation_player.play("ready")
	canvas_layer.queue_free()
	await animation_player.animation_finished
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
