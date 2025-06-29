extends Area2D

func _ready():
	# Connect signal programmatically (optional if you use the editor)
	connect("body_entered", Callable(self, "_on_body_entered"))


@export var fade_time := 0.2
var fading := false
var fade_timer := 0.0

  

func _process(delta):
	if fading:
		fade_timer += delta
		var t = fade_timer / fade_time
		$Sprite2D.modulate.a = lerp(1.0, 0.0, t)
		if t >= 1.0:
			queue_free()

func _on_body_entered(body):
	print(body)
	if body.name == "Cat":
		$AudioStreamPlayer2D.play()
		fading = true
		set_process(true)
		
