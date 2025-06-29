extends Area2D

var was_transition_triggered = false

var exiting = false
func _ready():
	$AnimationPlayer.play("idle")
	# Connect signal programmatically (optional if you use the editor)
	connect("body_entered", Callable(self, "_on_body_entered"))
var time = 0.0
func _physics_process(delta: float) -> void:
	if not exiting:
		time += 1.0
	$CanvasLayer/Label.text = str(int(time/60))
func _on_body_entered(body):
	if was_transition_triggered:
		return
	
	if body.name == "Cat":
		exiting = true
		was_transition_triggered = true
		
		body.hide()
		body.frozen = true
		
		
		#body.queue_free()
		
		var exit = get_parent()
		
		$Timer.start()
		$Timer2.start()
		
		$AnimationPlayer.play("exit")

func _on_timer_timeout() -> void:
	
	get_tree().change_scene_to_file(get_parent().lvlPath)
	


func _on_timer_2_timeout() -> void:
	get_parent().get_parent().get_node("UI").fade_into_black()
