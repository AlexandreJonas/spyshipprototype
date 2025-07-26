extends CanvasLayer

var countdown_value : int = 3

signal signal_new_game

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	manage_countdown()
	
func manage_countdown() -> void:
	$lbl_countdown.text = str(countdown_value) + "!" 
	
func start_game() -> void:
	visible = false
	$timer_countdown.stop()
	signal_new_game.emit()

func _on_timer_countdown_timeout() -> void:
	countdown_value -= 1
	if countdown_value < 0:
		start_game()
	else:
		manage_countdown()
