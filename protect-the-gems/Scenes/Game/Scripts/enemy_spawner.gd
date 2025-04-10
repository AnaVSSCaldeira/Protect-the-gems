extends Marker2D

var enemy_1 = preload("res://Scenes/Game/Scenes/goblin.tscn")
var enemy_count = 0
@export var enemies_list: Array = []
@onready var timer = $Timer

# func _ready():
# 	timer.stop()

func call_parent():
	return get_parent().return_gems()

func _on_timer_timeout():
	if enemy_count < enemies_list.size():
		var goblin = enemy_1.instantiate()
		# goblin.position = Vector2(position.x, position.y)
		add_child(goblin)
		enemy_count += 1
	else:
		$Timer.stop()
