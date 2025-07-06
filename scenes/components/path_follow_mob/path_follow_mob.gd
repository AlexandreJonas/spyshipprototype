extends PathFollow2D

@export var speed = 0.1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress_ratio += delta * speed

func add_mob(spawn_path_point : float, mob_scene : PackedScene) -> void :
	var mob = mob_scene.instantiate()
	
	progress_ratio = spawn_path_point
	
	mob.position = Vector2(0,0)
	add_child(mob)
