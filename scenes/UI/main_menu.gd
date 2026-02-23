extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$OST.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_btn_start_game_pressed() -> void:
	$OST.stop()
	Global.goto_scene("res://scenes/levels/level_1.tscn")


func _on_btn_exit_pressed() -> void:
	get_tree().quit()
