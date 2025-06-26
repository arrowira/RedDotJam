extends Area2D

func _ready():
    
    # Connect signal programmatically (optional if you use the editor)
    connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
    
    if body.name == "Cat":
        print("endLvl")
        
        #body.queue_free()
        
        var exit = get_parent()
        exit.ui.fade_into_black()
        
        $Timer.start()
        
        
        
    


func _on_timer_timeout() -> void:
    get_tree().change_scene_to_file(get_parent().lvlPath)
