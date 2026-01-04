extends Node2D

@export var backgroundMode : String = "MainMenu"

@onready var BackGroundRect : TextureRect = $TextureRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	match backgroundMode:
		"MainMenu":
			BackGroundRect.texture = preload("res://assets/background/main_menu.png")

		"LevelOne":
			BackGroundRect.texture = preload("res://assets/background/level_1.png")
			
		"GameOver":
			BackGroundRect.texture = preload("res://assets/background/game_over.png")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
