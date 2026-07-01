extends CanvasLayer
@onready var bird: CharacterBody3D = $"../Bird"

@onready var score: Label = $Score
@onready var best: Label = $Best

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.best < Global.scoree:
		Global.best = Global.scoree
	score.text = str(Global.scoree)
	best.text = str(Global.best)
