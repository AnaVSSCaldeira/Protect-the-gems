extends Node2D

@onready var child_gem

func _ready():
	Input.set_custom_mouse_cursor($"/root/Global".current_weapon)
	var enemy_spawner_list = [$Enemy_Spawner, $Enemy_Spawner2, $Enemy_Spawner3, $Enemy_Spawner4]
	$"/root/Global".read_json_waves(enemy_spawner_list)

func return_gems():
	child_gem = $Gems
	return child_gem

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_custom_mouse_cursor(null)
		get_tree().change_scene_to_file("res://Scenes/Main menu/main_menu.tscn")