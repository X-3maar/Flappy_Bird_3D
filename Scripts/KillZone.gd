extends Area3D



func _on_body_entered(body: Node3D) -> void:
	
	if body.name == "Bird":
		get_tree().paused = true
		Global.score = 0
