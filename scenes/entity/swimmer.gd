extends RigidBody2D

@export var speed : int = 100 
signal entered_by_back(score: int, score_message :String)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_back_area_entered(area: Area2D) -> void:
	#entered_by_back.emit(5,"Clever Little Sneak")
	pass
