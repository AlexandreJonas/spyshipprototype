extends CanvasLayer
var score :int = 0
var lifes :int = 3
signal game_over
signal signal_new_game

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_score(0)
	update_lifes(0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_score(score_to_add:int) -> void:
	score += score_to_add
	$lbl_score.text = str(score)

func update_log(message:String) -> void:
	$lbl_log_message.text = message
	
func update_lifes(life_to_sub:int) -> void:
	if lifes > 0:
		lifes -= life_to_sub
		$lbl_life_value.text = str(lifes)
	else:
		game_over.emit()
		Global.current_scene_path = "res://scenes/levels/testing_area.tscn"
		Global.goto_scene("res://scenes/UI/game_over.tscn")
		
func new_game() -> void:
	score = 0
	lifes = 3
	update_score(0)
	update_lifes(0)

func _on_player_add_score(score: int, score_message: String) -> void:
	update_score(score)
	update_log(score_message)

func _on_player_hit() -> void:
	update_lifes(1)

func _on_button_pressed() -> void:
	new_game()
	signal_new_game.emit()

func _on_swimmer_entered_by_back(score: int, score_message: String) -> void:
	update_score(score)
	update_log(score_message)
	
func _on_walker_entered_by_back(score: int, score_message: String) -> void:
	update_score(score)
	update_log(score_message)
	
func _on_coin_add_score(score:int,score_message:String):
	update_score(score)
	update_log(score_message)
