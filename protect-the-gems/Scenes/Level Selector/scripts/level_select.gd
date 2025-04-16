extends Node2D

@onready var lvl_desc = $Level_desc
var final_json
var label
var level

func _ready():
	$Money/Count.text = str($"/root/Global".player_money)
	label = lvl_desc.get_node("Label")
	var file = FileAccess.open("res://Scenes/Level Selector/Jsons/Levels_desc.json", FileAccess.READ)
	var content = file.get_as_text()
	var json = JSON.new()
	final_json = json.parse_string(content)

func read_json(key: String):
	var text = (final_json.level_description)[key]["title"]+"\n"+(final_json.level_description)[key]["description"]
	label.text = text
	lvl_desc.visible = true

func _on_lvl_1_pressed():
	read_json("level_1")
	level = "Level_1"

func _on_lvl_2_pressed():
	read_json("level_2")
	level = "Level_2"

func _on_lvl_3_pressed():
	read_json("level_3")
	level = "Level_3"

func _on_lvl_4_pressed():
	read_json("level_4")
	level = "Level_4"

func _on_lvl_5_pressed():
	read_json("level_5")
	level = "Level_5"

func _on_close_pressed():
	lvl_desc.visible = false

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/Game/Scenes/"+level+".tscn")
