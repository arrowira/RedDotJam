extends CharacterBody2D



const jumpVelocity = -400.0
@export var speed = 3
var dir = 0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	#direction cat moves in
	dir = get_global_mouse_position().x-position.x
	if dir <0:
		dir = -1
	else:
		dir = 1
		
	
	#cat movement
	velocity.x+=dir*delta*speed
	#jump checks
	if abs(get_global_mouse_position().y-position.y)>60 and get_global_mouse_position().y<position.y and is_on_floor():
		#if in jump range
		if abs(get_global_mouse_position().x-position.x)<100:
			velocity.y = jumpVelocity

		
		
	

	

	move_and_slide()
