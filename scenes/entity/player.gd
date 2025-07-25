extends CharacterBody2D

signal hit
signal add_score(score: int, score_message :String)
@export var speed = 400 # How fast the player will move (pixels/sec).
@export var move_score : int = 1

var screen_size: Vector2 # Size of the game window.
var is_invincible: bool = false

func _ready():
	screen_size = get_viewport_rect().size
	#hide()
	
func _process(delta):
	velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		$tmr_is_moving_score.start()
	
	if move_and_collide(velocity * delta):
		$tmr_is_moving_score.start()
	
	position = position.clamp(Vector2.ZERO, screen_size)
	invincibility(is_invincible)

func invincibility(is_invincible:bool) -> void:
	if is_invincible:
		$HitFlashAnimationPlayer.play("hit_flash")
		$HitFlashAnimationPlayer.active = true
	else:
		$HitFlashAnimationPlayer.play('RESET')
		$HitFlashAnimationPlayer.active = false
	
	$Area2D/CollisionShape2D.set_deferred("disabled",is_invincible)

func _on_area_2d_body_entered(body: Node2D) -> void:
	is_invincible = true
	$tmr_invincibility.start()
	hit.emit()

func _on_tmr_is_moving_score_timeout() -> void:
	add_score.emit(move_score, "We moving")

func _on_tmr_invincibility_timeout() -> void:
	is_invincible = false

func _on_level_hud_game_over() -> void:
	hide()
	$Area2D/CollisionShape2D.set_deferred("disabled",true)
	$Back/CollisionShape2D.set_deferred("disabled",true)

func _on_level_hud_signal_new_game() -> void:
	#position = $PlayerStart.global_position
	show()
	$Area2D/CollisionShape2D.set_deferred("disabled",false)
	$Back/CollisionShape2D.set_deferred("disabled",false)

func _on_back_area_entered(area: Area2D) -> void:
	
	#2 = Enemy Back
	if area.collision_layer == 2:
		var back_score : int = area.back_score
		add_score.emit(back_score,"Clever Little Sneak")
		
	#Bit 6, value 32 = Collectible
	if area.collision_layer == 32:
		var collect_score = area.collect_score
		add_score.emit(collect_score,"Finders Keepers")
		area.queue_free()
