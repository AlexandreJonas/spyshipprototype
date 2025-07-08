extends Node
@export var collectible_scene : PackedScene
@export var collectible_marker : Marker2D
@export var collectible_score : int = 10
@export var time_on_screen : int = 40

var collectible

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$DespawnTimer.wait_time = time_on_screen
	spawn()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn() -> void:
	collectible = collectible_scene.instantiate()
	collectible.collect_score = collectible_score
	collectible.position = collectible_marker.position
	add_child(collectible)
	
	$DespawnTimer.start()
	
func despawn() -> void:
	collectible.queue_free()

func _on_despawn_timer_timeout() -> void:
	despawn()
