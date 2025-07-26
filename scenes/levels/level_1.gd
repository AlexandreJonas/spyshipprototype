extends Node2D
var time : int = 0
var player_scene : PackedScene = preload("res://scenes/entity/player.tscn")
var player

signal signal_end_level

func _ready() -> void:
	$LevelHUD.visible = false

func _process(delta: float) -> void:
	pass

func _on_clock_timeout() -> void:
	time = time + 1
	time_control_spawns()

func time_control_spawns() -> void:
	match time:
		0:
			$SpawnLines/Line1/Enemies/SingleMobSpawner.spawn()
			$SpawnLines/Line1/Enemies/SingleMobSpawner2.spawn()
			$SpawnLines/Line2/SingleMobSpawner.spawn()
			
			$Collectibles/Wave1/FunnyCoin.spawn()
			$Collectibles/Wave1/SingleCollectibleSpawner.spawn()
			$Collectibles/Wave1/SingleCollectibleSpawner2.spawn()
			$Collectibles/Wave1/SingleCollectibleSpawner3.spawn()
			
		5:
			$Collectibles/Wave1/FunnyCoin.despawn()
		10:
			$OutsideRngSpawner.is_active = true
		20:
			$SpawnLines/Line1/Enemies/SingleMobSpawner.despawn()
			$SpawnLines/Line1/Enemies/SingleMobSpawner2.despawn()
			$SpawnLines/Line2/SingleMobSpawner.despawn()
			
			$Collectibles/Wave2/Wave2Coin1.spawn()
			$Collectibles/Wave2/Wave2Coin2.spawn()
			$Collectibles/Wave2/Wave2Coin3.spawn()
			
		30:
			$Collectibles/Wave1/SingleCollectibleSpawner.despawn()
			$Collectibles/Wave1/SingleCollectibleSpawner2.despawn()
			$Collectibles/Wave1/SingleCollectibleSpawner3.despawn()
		40:
			$OutsideRngSpawner.is_active = false
			
			$Collectibles/Wave2/Wave2Coin1.despawn()
			$Collectibles/Wave2/Wave2Coin2.despawn()
			$Collectibles/Wave2/Wave2Coin3.despawn()
			
			$SpawnLines/Wave2/Line3/Line3Mob1.spawn()
			$SpawnLines/Wave2/Line3/Line3Coin1.spawn()
			$SpawnLines/Wave2/Line3/Line3Mob2.spawn()
			
			$SpawnLines/Wave2/Line3/Line3Mob3.spawn()
			$SpawnLines/Wave2/Line3/Line3Coin2.spawn()
			$SpawnLines/Wave2/Line3/Line3Mob4.spawn()
			
			$SpawnLines/Wave2/Line4/Line4Mob1.spawn()
			$Collectibles/Wave3/Wave3Coin1.spawn()
			$SpawnLines/Wave2/Line4/Line4Mob2.spawn()
			
		60:
			$SpawnLines/Wave2/Line3/Line3Mob1.despawn()
			$SpawnLines/Wave2/Line3/Line3Coin1.despawn()
			$SpawnLines/Wave2/Line3/Line3Mob2.despawn()
			
			$SpawnLines/Wave2/Line3/Line3Mob3.despawn()
			$SpawnLines/Wave2/Line3/Line3Coin2.despawn()
			$SpawnLines/Wave2/Line3/Line3Mob4.despawn()
			
			$SpawnLines/Wave2/Line4/Line4Mob1.despawn()
			$Collectibles/Wave3/Wave3Coin1.despawn()
			$SpawnLines/Wave2/Line4/Line4Mob2.despawn()
			
			signal_end_level.emit()

func _on_new_game_signal_new_game() -> void:
	player = player_scene.instantiate()
	player.position = $PlayerStartMarker.position
	print(player.name)
	add_child(player)
	$LevelHUD.visible = true
	$LevelHUD.new_game()
	time_control_spawns()
	$Clock.start()
