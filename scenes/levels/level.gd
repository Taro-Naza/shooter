extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")

func _on_gate_player_enter(_body):
	print('player entered')

func _on_gate_player_exit(body):
	print('player exited')

func _on_player_laser(position):
	var laser = laser_scene.instantiate()
	laser.position = position
	#	move the laser
	#	add laser instance to Node2D
	add_child(laser)
	
func _on_player_grenade():
	print('grenade thrown')
