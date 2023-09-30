extends Node2D

var SPEED: int = 100

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_gate_player_enter(_body):
	print('player entered')

func _on_gate_player_exit(_body):
	print('player exited')

func _on_player_laser(laser_spawn_position):
	var laser = laser_scene.instantiate()
	laser.position = laser_spawn_position
	$Projectiles.add_child(laser)
	
func _on_player_grenade(grenade_spawn_position):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = grenade_spawn_position
	grenade.linear_velocity = Vector2.UP * SPEED
	$Projectiles.add_child(grenade)
