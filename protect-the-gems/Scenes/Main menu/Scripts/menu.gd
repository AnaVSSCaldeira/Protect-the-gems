extends Node2D

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/Level Selector/level_select.tscn")

func _on_leave_pressed():
	get_tree().quit()
