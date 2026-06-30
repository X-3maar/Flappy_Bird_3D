extends Area3D

func _physics_process(delta: float) -> void:
	if Global.score > Global.best:
		Global.best = Global.score
func _on_body_entered(body: Node3D) -> void:
	Global.score +=1
