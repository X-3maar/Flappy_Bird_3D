extends Node3D
const PIPE = preload("uid://bbpuoatp75b2q")

var timer = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var pipe = PIPE.instantiate()
	timer += delta
	if timer > 3:
		add_child(pipe)
		timer = 0
