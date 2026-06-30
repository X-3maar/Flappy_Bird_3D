extends AnimatableBody3D

var SPeed = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	SPeed = 0.05 * Global.score + 7
	position.z +=  SPeed * delta
