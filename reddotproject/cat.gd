extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
@export var speed = 3
var dir = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	#direction cat moves in
	dir = get_global_mouse_position().x-position.x
	if dir <0:
		dir = -1
	else:
		dir = 1
		
	
	#cat movement
	if abs(get_global_mouse_position().y-position.y)<30:
		#walk
		
		position.x+=dir*delta*speed
	elif get_global_mouse_position().y>position.y:
		#jump
		pass
		
