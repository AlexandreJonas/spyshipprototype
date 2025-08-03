extends CanvasLayer

@export var current_scene_path: String = "res://scenes/levels/testing_area.tscn"
var score :int = 0
var lifes :int = 3
var tween := create_tween()
var visible_color = Color(1.0, 1.0, 1.0, 1.0)
var invisible_color = Color(1.0, 1.0, 1.0, 0.2)

signal signal_new_game

func _ready() -> void:
	update_score(0)
	update_lifes(0)

func _process(delta: float) -> void:
	$Panel/lbl_clock_value.text = $Clock.get_clock_str()

func update_score(score_to_add:int) -> void:
	score += score_to_add
	$Panel/lbl_score.text = str(score)

func update_log(message:String) -> void:
	$Panel/lbl_log_message.text = message
	
func update_lifes(life_to_sub:int) -> void:
	if lifes > 0:
		lifes -= life_to_sub
		$Panel/lbl_life_value.text = str(lifes)
	else:
		game_over(false)
		
func new_game() -> void:
	var player = get_node("../Player")
	player.hit.connect(_on_player_hit)
	player.add_score.connect(_on_player_add_score)
	score = 0
	lifes = 3
	update_score(0)
	update_lifes(0)
	$Clock.start_clock()
	
func game_over(is_level_win : bool) -> void:
	Global.final_score = score
	Global.is_level_win = is_level_win
	Global.current_scene_path = current_scene_path
	Global.goto_scene("res://scenes/UI/game_over.tscn")

func _on_player_add_score(score: int, score_message: String) -> void:
	update_score(score)
	update_log(score_message)

func _on_player_hit() -> void:
	update_lifes(1)

func _on_button_pressed() -> void:
	new_game()
	signal_new_game.emit()

func _on_level_1_signal_end_level() -> void:
	game_over(true)

func decrease_opacity() -> void:
	reset_tween()
	tween.tween_property($Panel,"modulate",invisible_color,1.0)
	
func increase_opacity() -> void:
	reset_tween()
	tween.tween_property($Panel,"modulate",visible_color,1.0)
	
func reset_tween() -> void:
	if tween:
		tween.kill()
	tween = create_tween()

func _on_area_2d_area_entered(area: Area2D) -> void:
	print('IM IN')
	decrease_opacity()

func _on_area_2d_area_exited(area: Area2D) -> void:
	print('IM OUT')
	increase_opacity()
