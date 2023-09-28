extends CharacterBody2D

var direction: Vector2
const SPEED: int = 500
var can_laser: bool = true
var can_grenade: bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	direction = Input.get_vector('left', 'right', 'up', 'down')
	velocity =  direction * SPEED 
	move_and_slide()
#
	if Input.is_action_pressed('primary action'): 
		print('Shooting')
		can_laser = false
		$Timer.start()
		
	if Input.is_action_pressed('secondary action'):
		print('throw grenade')
		can_grenade = false 
		$Timer2.start()


func _on_timer_timeout():
	can_laser = true

func _on_timer_2_timeout():
	can_grenade = true
