extends CharacterBody2D

signal laser(position)
signal grenade

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
	if Input.is_action_pressed('primary action') && can_laser: 
		can_laser = false
		var laser_markers = $LaserStartPosition.get_children()
		var selected_laser =  laser_markers.pick_random()
		print(selected_laser)
		laser.emit(selected_laser.global_position)
		$LaserReloadTimer.start()
		
	if Input.is_action_pressed('secondary action') && can_grenade:
		grenade.emit()
		can_grenade = false 
		$GrenadeReloadTimer.start()


func _on_laser_reload_timer_timeout():
	can_laser = true

func _on_grenade_reload_timer_timeout():
	can_grenade = true
	
	
