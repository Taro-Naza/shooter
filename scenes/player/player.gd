extends CharacterBody2D

#signals declarations
signal laser(position)
signal grenade(position)

#cariables
var direction: Vector2
var can_laser: bool = true
var can_grenade: bool = true

#constants
const SPEED: int = 500

func _ready():
	pass 

func _process(_delta):
	direction = Input.get_vector('left', 'right', 'up', 'down')
	velocity =  direction * SPEED 
	move_and_slide()
	
	#	rotate
	look_at(get_global_mouse_position())
	
	if Input.is_action_pressed('primary action') && can_laser: 
		can_laser = false
		var laser_markers = $LaserStartPosition.get_children()
		var selected_laser =  laser_markers.pick_random()
		laser.emit(selected_laser.global_position)
		$LaserReloadTimer.start()
		
	if Input.is_action_pressed('secondary action') && can_grenade:
		can_grenade = false 
		var grenade_markers = $LaserStartPosition.get_children()
		var selected_grenade = grenade_markers.pick_random()
		grenade.emit(selected_grenade.global_position)
		$GrenadeReloadTimer.start()

#timer signals
func _on_laser_reload_timer_timeout():
	can_laser = true

func _on_grenade_reload_timer_timeout():
	can_grenade = true
	
	
