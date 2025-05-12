extends Node2D

@onready var child_gem
var enemy_spawner_list
var finishied_waves = 0
var money = 0

func _ready():
	$"/root/Global".finishied_waves = 0
	$Screen.visible = false
	Input.set_custom_mouse_cursor($"/root/Global".current_weapon)
	enemy_spawner_list = [$Enemy_Spawner, $Enemy_Spawner2, $Enemy_Spawner3, $Enemy_Spawner4]
	finishied_waves = enemy_spawner_list.size()
	$"/root/Global".read_json_waves(enemy_spawner_list)
	$Money/Count.text = str(money)
	update_life()

func return_gems():
	child_gem = $Gems
	return child_gem

func get_coins(coins):
	money = money + coins
	$Money/Count.text = str(money)

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_custom_mouse_cursor(null)
		$Screen.visible = true
		$Screen.get_node("Close").visible = true
		get_tree().paused = true

	if finishied_waves == $"/root/Global".finishied_waves and ($Enemy_Spawner.get_child_count() == 2 and $Enemy_Spawner2.get_child_count() == 2 and $Enemy_Spawner3.get_child_count() == 2 and $Enemy_Spawner4.get_child_count() == 2):
		level_complete()

func game_over():
	get_tree().paused = true
	Input.set_custom_mouse_cursor(null)
	$Screen.get_node("Text").text = "Você perdeu todas as suas gemas!"
	$Screen.get_node("Close").visible = false
	$Screen.visible = true

func level_complete():
	get_tree().paused = true
	Input.set_custom_mouse_cursor(null)
	$Screen.get_node("Text").text = "Você ganhou! Eba!"
	$Screen.get_node("Close").visible = false
	$Screen.visible = true
	$"/root/Global".player_money += money

func _on_menu_pressed():
	get_tree().paused = false
	Input.set_custom_mouse_cursor(null)
	get_tree().change_scene_to_file("res://Scenes/Level Selector/Scenes/level_select.tscn")

func _on_restart_pressed():
	$Screen.visible = false
	get_tree().paused = false
	Input.set_custom_mouse_cursor(null)
	get_tree().reload_current_scene()

func _on_close_pressed():
	get_tree().paused = false
	Input.set_custom_mouse_cursor($"/root/Global".current_weapon)
	$Screen.visible = false

func update_life():
	$Gems_count/Count.text = str($Gems.life)