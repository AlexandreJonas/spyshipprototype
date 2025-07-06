extends Node
@export var mob_path: Path2D
@export var mob_follow_scene : PackedScene = preload("res://scenes/components/path_follow_mob/path_follow_mob.tscn")
@export var mob_scene: PackedScene
@export var is_despawn: bool = false
@export var speed : float = 0.1
@export var spawn_path_point : float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn() -> void:
	var children_index = mob_path.get_child_count()
	mob_path.add_child(mob_follow_scene.instantiate())
	
	var mob_spawn_location : PathFollow2D = mob_path.get_children().get(children_index)
	mob_spawn_location.speed = speed
	mob_spawn_location.add_mob(spawn_path_point, mob_scene)
