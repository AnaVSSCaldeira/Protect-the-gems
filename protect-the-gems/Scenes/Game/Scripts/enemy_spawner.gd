extends Marker2D

var goblin = preload("res://Scenes/Game/Scenes/goblin.tscn")
# var slime = preload("res://Scenes/Game/Scenes/slime.tscn")
var coin = preload("res://Scenes/Game/Scenes/coin.tscn")
var enemy_count = 0
@export var enemies_list: Array = []
@onready var timer = $Timer
var flag = true

func _process(delta):
	if enemy_count >= enemies_list.size() and flag == true:
		print("oi", enemy_count)
		$"/root/Global".finishied_waves += 1
		$Timer.stop()
		flag = false

func call_parent():
	return get_parent()

func _on_timer_timeout():
	if enemy_count < enemies_list.size():
		var child
		
		if enemies_list[enemy_count] == "goblin":
			var goblin_scene = goblin.instantiate()
			child = goblin_scene

		# elif enemies_list[enemy_count] == "slime":
		# 	var slime_scene = slime.instantiate()
		# 	child = slime_scene

		add_child(child)
		enemy_count += 1
		
	# else:
	# 	$"/root/Global".finishied_waves += 1
	# 	$Timer.stop()

func spawn_coins(position):
	var coin_obj = coin.instantiate()
	coin_obj.position = Vector2((position.x), (position.y))
	add_child(coin_obj)
