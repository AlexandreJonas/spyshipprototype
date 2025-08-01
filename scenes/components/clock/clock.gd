extends Node2D

var seconds : int = 0
var minutes : int = 0
var str_clock : String = "0:00"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func start_clock() -> void:
	seconds = 0
	minutes = 0
	$Timer.start()

func _set_clock_str() -> void:
	var aux_str : String = "0" if seconds < 10 else ""
	str_clock = str(minutes) + ":" + aux_str + str(seconds)

func _on_timer_timeout() -> void:
	seconds += 1
	if seconds > 59:
		seconds = 0
		minutes += 1
	_set_clock_str()
		
func get_clock_str() -> String:
	return str_clock
