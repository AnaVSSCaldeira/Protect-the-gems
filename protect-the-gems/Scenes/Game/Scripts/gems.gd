extends Area2D

var life = 5

func _on_area_entered(area:Area2D):
    if life > 0:
        if area.name == "goblin":
            life -= 1
            get_parent().update_life()
    else:
        get_parent().game_over()