extends RigidBody2D

@export var speed : int = 300 
@export var is_deletable : bool = false
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


func _on_mob_on_screen_notifier_screen_entered() -> void:
	$DespawnTimer.stop()


func _on_mob_on_screen_notifier_screen_exited() -> void:
	if is_deletable:
		$DespawnTimer.start()


func _on_despawn_timer_timeout() -> void:
	queue_free()
