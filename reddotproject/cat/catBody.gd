extends CharacterBody2D

@export var jumpVelocity = -400.0
@export var speed = 3
@export var friction = 0.05

var dir = 0
var seesPointer = false
var redDotVisible = true

@onready var vision = $vision
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D


func _ready() -> void:
    Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _physics_process(delta: float) -> void:
    vision.target_position = to_local(get_global_mouse_position())
    if vision.is_colliding():
        redDotVisible = false
        #high friction
        velocity.x = lerp(velocity.x, 0.0, 100*friction)
    else:
        
        redDotVisible = true
        #low friction
        velocity.x = lerp(velocity.x, 0.0, 10*friction)
    # Add the gravity.
    if not is_on_floor():
        velocity += get_gravity() * delta
    else:
        animation_player.play("walk")
    if redDotVisible:
        #direction cat moves in
        dir = get_global_mouse_position().x-position.x
        if dir <0:
            dir = -1
            
        else:
            dir = 1
            
        
        #cat movement
        velocity.x+=dir*delta*speed
        
        if velocity.x >0:
            sprite_2d.flip_h = false
        else:
            sprite_2d.flip_h = true
        
        #jump checks
        if abs(get_global_mouse_position().y-position.y)>60 and get_global_mouse_position().y<position.y and is_on_floor():
            #if in jump range
            if abs(get_global_mouse_position().x-position.x)<150:
                velocity.y = jumpVelocity

    if velocity.x < 5 and velocity.x > -5:
            animation_player.play("RESET")
    
    move_and_slide()
