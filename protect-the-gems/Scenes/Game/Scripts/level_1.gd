extends Node2D

@onready var child_gem

func _ready():
	$Game_Manager.change_cursor()
	var waves = ($"/root/Global".read_json_waves())["level_1"]

	$Enemy_Spawner.enemies_list = waves["wave_1"]["enemies_list"]
	$Enemy_Spawner2.enemies_list = waves["wave_2"]["enemies_list"]
	$Enemy_Spawner3.enemies_list = waves["wave_3"]["enemies_list"]
	$Enemy_Spawner4.enemies_list = waves["wave_4"]["enemies_list"]

	$Enemy_Spawner.timer.set_wait_time(1)
	$Enemy_Spawner2.timer.set_wait_time(9)
	$Enemy_Spawner3.timer.set_wait_time(7)
	$Enemy_Spawner4.timer.set_wait_time(4)

	$Enemy_Spawner.timer.start()
	$Enemy_Spawner2.timer.start()
	$Enemy_Spawner3.timer.start()
	$Enemy_Spawner4.timer.start()


func return_gems():
	child_gem = $Gems
	return child_gem	

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_custom_mouse_cursor(null)
		get_tree().change_scene_to_file("res://Scenes/Main menu/main_menu.tscn")
