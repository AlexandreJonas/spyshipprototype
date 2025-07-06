extends Node
@export var mob_path: Path2D
@export var mob_scene: PackedScene
@export var is_despawn: bool = false
@export var spawn_path_point : float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn() -> void:
	var mob = mob_scene.instantiate()
	
	var mob_spawn_location : PathFollow2D = mob_path.get_children().get(0)
	mob_spawn_location.progress_ratio = spawn_path_point
	
	mob.position =  Vector2(0,0)
	mob_spawn_location.add_child(mob)
