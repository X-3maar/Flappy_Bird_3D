extends Area3D



func _on_body_entered(body: Node3D) -> void:
	
	if body.name == "Bird":
		Engine.time_scale = 0.0
		Global.score = 0
		body.dead = true
