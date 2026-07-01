extends Node3D
const CLOUD = preload("uid://olau5k3wlt8w")

var timer = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var cloud = CLOUD.instantiate()
	timer -= delta
	if timer <= 0:
		add_child(cloud)
		timer = 5
	cloud.position.y = position.y + randf_range(-2,2)
