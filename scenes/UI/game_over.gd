extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_btn_return_main_menu_pressed() -> void:
	Global.goto_scene("res://scenes/UI/main_menu.tscn")

func _on_btn_try_again_pressed() -> void:
	var failed_level_path : String = Global.current_scene_path
	if failed_level_path != null:
		Global.goto_scene(failed_level_path)
