extends Node2D

@export var lvlName = ""
@export var lvlPath = "res://levels/" + lvlName + ".tscn"

@onready var ui: CanvasLayer = $"../UI"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    lvlPath = "res://levels/" + lvlName + ".tscn"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    if Input.is_action_pressed("restart"):
        get_tree().reload_current_scene()
