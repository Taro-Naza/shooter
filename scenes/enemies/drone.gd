extends CharacterBody2D

var direction: Vector2
const SPEED: int = 100

func _process(delta): 
	direction = Vector2.RIGHT
	velocity = direction * SPEED 
	move_and_slide()
