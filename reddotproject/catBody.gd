extends CharacterBody2D



@export var jumpVelocity = -5000.0
@export var speed = 3
@export var friction = 0.05
var dir = 0
var seesPointer = false
var redDotVisible = true
func _physics_process(delta: float) -> void:
	
	
	
	$vision.target_position = to_local(get_global_mouse_position())
	if $vision.is_colliding():
		redDotVisible = false
		#high friction
		velocity.x = lerp(velocity.x, 0.0, 10*friction)
	else:
		
		redDotVisible = true
		#low friction
		velocity.x = lerp(velocity.x, 0.0, friction)
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if redDotVisible:
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
			if abs(get_global_mouse_position().x-position.x)<150:
				velocity.y = jumpVelocity

		
		
	

	

	move_and_slide()
