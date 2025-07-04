extends Node

@export var mob_path: Path2D
@export var mob_scene: PackedScene
@export var is_active: bool = false
@export var speed : int = 300

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(mob_path.get_children().get(0)) 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not is_active:
		$MobTimer.stop()


func _on_mob_timer_timeout() -> void:
	# Create a new instance of the Mob scene.
	var mob = mob_scene.instantiate()
	
	mob.is_deletable = true
	# Choose a random location on Path2D.
	var mob_spawn_location : PathFollow2D = mob_path.get_children().get(0)
	mob_spawn_location.progress_ratio = randf()

	# Set the mob's position to the random location.
	mob.position = mob_spawn_location.position

	# Set the mob's direction perpendicular to the path direction.
	var direction = mob_spawn_location.rotation - PI / 2

	# Add some randomness to the direction.
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction

	# Choose the velocity for the mob.
	var velocity = Vector2(mob.speed, 0.0)
	mob.linear_velocity = velocity.rotated(direction)

	# Spawn the mob by adding it to the Main scene.
	add_child(mob)
