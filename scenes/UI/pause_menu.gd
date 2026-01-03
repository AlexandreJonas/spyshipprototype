extends Control

signal gamePaused
signal gameResumed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("return_menu") :
		if !get_tree().paused:
			pause()
		else:
			resume()
	
func resume() -> void:
	visible = false
	gameResumed.emit()
	get_tree().paused = false
	
func pause() -> void:
	visible = true
	gamePaused.emit()
	get_tree().paused = true

func _on_btn_resume_pressed() -> void:
	resume()

func _on_btn_restart_pressed() -> void:
	resume()
	get_tree().reload_current_scene()

func _on_btn_quit_to_title_pressed() -> void:
	resume()
	Global.goto_scene("res://scenes/UI/main_menu.tscn")
	
