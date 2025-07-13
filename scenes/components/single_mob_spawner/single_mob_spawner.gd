extends Node
@export var time_on_screen : int = 20
@export var mob_path: Path2D
@export var mob_follow_scene : PackedScene = preload("res://scenes/components/path_follow_mob/path_follow_mob.tscn")
@export var mob_scene: PackedScene
@export var is_despawn: bool = false
@export var speed : float = 0.1
@export var spawn_path_point : float = 0.0

var children_index : int = 0
var mob_spawn_location : PathFollow2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$DespawnTimer.wait_time = time_on_screen
	spawn()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn() -> void:
	children_index = mob_path.get_child_count()
	mob_path.add_child(mob_follow_scene.instantiate())
	
	mob_spawn_location = mob_path.get_children().get(children_index)
	mob_spawn_location.speed = speed
	mob_spawn_location.add_mob(spawn_path_point, mob_scene)
	
	if time_on_screen > 0:
		$DespawnTimer.start()
	
func despawn() -> void:
	var child_count : int = mob_spawn_location.get_child_count()
	for i in child_count:
		mob_spawn_location.get_child(i).queue_free()


func _on_despawn_timer_timeout() -> void:
	despawn()
