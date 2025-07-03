extends Area2D
@export var collect_score : int = 10
signal add_score(score: int, score_message :String)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	#add_score.emit(collect_score, "Finders Keepers")
	#queue_free()
	pass
