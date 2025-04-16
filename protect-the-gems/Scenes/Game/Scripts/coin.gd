extends Area2D

func _on_mouse_entered():
    var get_coin = (get_parent().call_parent()).get_coins(5)
    queue_free()
